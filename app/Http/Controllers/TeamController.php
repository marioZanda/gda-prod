<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\TeamMember;
use App\Models\Team;
use App\Models\Superviser;
use App\Http\Requests\EditTeamRequest;
use App\Http\Requests\AddTeamRequest;

class TeamController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $teams = Team::with('members')->get();
        return view('dashboard.teams.index', ['teams'=>$teams]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $members = TeamMember::all();
        $supervisers = Superviser::all();
        return view('dashboard.teams.create', ['members'=>$members], ['supervisers'=>$supervisers]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(AddTeamRequest $request)
    {
        $chief = TeamMember::find($request->get('chief'));
        $superviser = Superviser::find($request->get('superviser'));
        $team = Team::create([
            'name' =>$superviser->lastname." - ".$chief->lastname,
            'superviser_id' => $request->get('superviser'),
        ]);
        $chief->team_id = $team->id;
        $chief->save();
        return redirect()->route('teams.index')->with('success', 'Equipe sauvegardée!');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $team = Team::find($id);
        $supervisers = Superviser::all();
        return view('dashboard.teams.edit', ['team' => $team, 'supervisers' => $supervisers]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(EditTeamRequest $request, $id)
    {
        $team = Team::find($id);
        $superviser = Superviser::find($request->get('superviser'));
        //$chief = $team->chief;
        $team->name = $superviser->lastname." - ".$team->chief->lastname;
        $team->superviser_id = $superviser->id;

        $team->save();
        return redirect()->route('teams.index')->with('success', 'Informations mises à jour !');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
    }
}
