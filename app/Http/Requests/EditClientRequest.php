<?php

namespace App\Http\Requests;

use Illuminate\Validation\Rule;
use Illuminate\Foundation\Http\FormRequest;

class EditClientRequest extends FormRequest
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
            'name' => [
                'max:255|required',
                Rule::unique('clients')
                ->ignore($this->segment(2))
            ],
            'address' => 'required',
            'contact' => 'required',
            'superviser' => 'required',
            'products' => 'nullable'
        ];
    }
}
