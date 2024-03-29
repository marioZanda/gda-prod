<?php

namespace App\Http\Requests;

use Illuminate\Validation\Rule;
use Illuminate\Foundation\Http\FormRequest;

class EditTeamMemberRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'firstname' => 'required|max:255',
            'lastname' => 'required|max:255',
            'lastname' =>  [
                'max:255|required',
                Rule::unique('team_members')
                ->ignore($this->segment(2))
                ->where('firstname', $this->firstname)
            ],
            'contact' => 'required',
            'title' => 'required',
            'team_id' => ['
                nullable',
                Rule::unique('team_members')
                       ->where('title', $this->title)
                    ],
        ];
    }
}
