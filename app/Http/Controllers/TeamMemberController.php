<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\TeamMember;
use App\Models\Team;
use App\Models\Mouvment;
use App\Http\Requests\EditTeamMemberRequest;
use App\Http\Requests\AddTeamMemberRequest;

class TeamMemberController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $member = TeamMember::with('team')->get();

        return view('dashboard.members.index', ['members'=> $member]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $teams = Team::all();
        return view('dashboard.members.create', ['teams' => $teams]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(AddTeamMemberRequest $request)
    {
        $member = TeamMember::create([
            'firstname' => $request->get('firstname'),
            'lastname' => $request->get('lastname'),
            'contact' => $request->get('contact'),
            'team_id' => $request->get('team_id'),
            'title' => $request->get('title')
        ]);
        $member->reference = "TM-".substr($member->lastname, 0, 4).$member->id;
        $member->save();
        return redirect()->route('members.index')->with('success', 'Membre d\'équipe sauvegardé!');
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
        $member = TeamMember::find($id);
        $teams = Team::all();
        return view('dashboard.members.edit', ['member' => $member, 'teams' => $teams]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(EditTeamMemberRequest $request, $id)
    {
        $member = TeamMember::find($id);
        $member->firstname = $request->get('firstname');
        $member->lastname = $request->get('lastname');
        $member->reference = "TM-".substr($member->lastname, 0, 4).$member->id;
        $member->contact = $request->get('contact');
        $member->team_id = $request->get('team_id');
        $member->title = $request->get('title');
        $member->save();
        return redirect()->route('members.index')->with('success', 'Informations mises à jour!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $member = TeamMember::find($id);
        Mouvment::where('team_member_id', $id)->delete();
        if ($member->title == "CHIEF") {
            $team = Team::find($member->team_id);
            if ($team->of !== null) {
                $team->of->team_id = null;
                $team->of->save();
                $member->team_id = null;
                $member->save();
            }
            $member->delete();
            $team->delete();
        } else {
            $member->delete();
        }
        return redirect('/members')->with('success', 'Membre d\'équipe supprimé!');
    }
}
