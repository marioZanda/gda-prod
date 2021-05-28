<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class EditSuperviserRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return false;
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
                Rule::unique('supervisers')
                ->ignore($this->segment(2))
                ->where('firstname', $this->firstname)
            ],
            'contact' => 'required|numeric',
            'domain' => 'required',
        ];
    }
}
