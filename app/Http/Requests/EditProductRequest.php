<?php

namespace App\Http\Requests;

use Illuminate\Validation\Rule;
use Illuminate\Foundation\Http\FormRequest;

class EditProductRequest extends FormRequest
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
            'reference' => 'required|max:255|unique:products,name,'.$this->segment(2),
            'nature' => 'required',
            'name' => 'required',
            'brand' => [
                'nullable',
                Rule::unique('products')
                ->ignore($this->segment(2))
                ->where('name', $this->name)
            ],
            'price' => 'required|numeric',
            'unit' => 'required',
        ];
    }
}
