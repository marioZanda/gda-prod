<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class EditSupplierRequest extends FormRequest
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
        //$supplier = Supplier::where('id', '=', '')
        return [
            'name' => 'required|max:255|unique:suppliers,name,'.$this->segment(2),
            'address' => 'required|max:255',
            'contact' => 'required',
        ];
    }
}