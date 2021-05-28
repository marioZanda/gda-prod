<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\TeamMember;
use App\Models\Team;
use App\Models\Superviser;
use App\Http\Requests\AddSuperviserRequest;

class SuperviserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $supervisers = Superviser::all();
        return view('dashboard.supervisers.index', ['supervisers'=>$supervisers]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('dashboard.supervisers.create', ['domains' => Superviser::getDomains()]);
    }
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(AddSuperviserRequest $request)
    {
        Superviser::create([
            'firstname' => $request->get('firstname'),
            'lastname' => $request->get('lastname'),
            'contact' => $request->get('contact'),
            'domain' => $request->get('domain'),
        ]);
        return redirect()->route('supervisers.index')->with('success', 'Conducteur de travaux sauvegardé!');
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
        $superviser = Superviser::find($id);
        return view('dashboard.supervisers.edit', ['superviser' => $superviser, 'domains' => Superviser::getDomains()]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $superviser = Superviser::find($id);
        $teams = Team::where('superviser_id', $superviser->id)->get();
        foreach ($teams as $team) {
            $chief = TeamMember::where('team_id', $team->id)->where('title', 'CHIEF')->first();
            $team->name = $request->get('lastname')." - ".$chief->lastname;
            $team->save();
        }
        $superviser->firstname = $request->get('firstname');
        $superviser->lastname = $request->get('lastname');
        $superviser->contact = $request->get('contact');
        $superviser->domain = $request->get('domain');

        $superviser->save();


        return redirect()->route('supervisers.index')->with('success', 'Informations mises à jour!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $superviser = Superviser::find($id);
        Team::where('superviser_id', $id)->delete();
        $superviser->delete();

        return redirect('/supervisers')->with('success', 'Contrôleur de travaux supprimé!');
    }
}
