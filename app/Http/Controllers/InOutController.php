<?php

namespace App\Http\Controllers;

use Illuminate\Support\Arr;
use Illuminate\Http\Request;
use App\Models\TeamMember;
use App\Models\Team;
use App\Models\Stock;
use App\Models\Space;
use App\Models\Product;
use App\Models\Mouvment;
use App\Http\Requests\AddEntryRequest;

class InOutController extends Controller
{
    public function index()
    {
        return view('dashboard.in-out.index');
    }

    public function in()
    {
        $products = Product::all();
        return view('dashboard.in-out.in.index', ['products' => $products]);
    }

    public function out()
    {
        $teams = Team::all();
        return view('dashboard.in-out.outt.index', ['teams' => $teams]);
    }

    public function ref_in(Request $request, $product_ref)
    {
        $product = Product::where('reference', $product_ref)->get();
        if ($product == null) {
            return response()->json(['error' => 'Identifiant inexistant'], 404);
        } else {
            return response()->json($product, 200);
        }
    }

    public function ref_out(Request $request, $product_ref)
    {
        $product = Product::with('stock')->where('reference', $product_ref)->get();
        if ($product == null) {
            return response()->json(['error' => 'Identifiant inexistant'], 404);
        } else {
            // $stock = Stock::where('product_id', $product->id);
            return response()->json($product, 200);
        }
    }

    public function ref_out_team(Request $request, $team_member_ref)
    {
        $member = TeamMember::where('reference', $team_member_ref)->get();
        if ($member == null) {
            return response()->json(['error' => 'Identifiant inexistant'], 404);
        } else {
            // $stock = Stock::where('product_id', $product->id);
            return response()->json($member, 200);
        }
    }


    public function in_store(Request $request)
    {
        $refs = explode(',', $request->get('refs_list'));
        $datas = [];
        foreach ($refs as $ref) {
            $value = $request->get('val_'.$ref);
            $datas = Arr::add($datas, $ref, $value);
        }
        Arr::forget($datas, '');
        $error = false;
        foreach ($datas as $key => $value) {
            $product = Product::where('reference', $key)->get('id')->toArray() ;
            if ($product == null) {
                $error = true;
            } else {
                $stock = Stock::where('product_id', $product[0]["id"])->first();
                if ($stock !== null) {
                    $stock->value += $value;
                    $stock->save();
                    Mouvment::create([
                        'action' => 'IN',
                        'product_id' => $product[0]["id"],
                        'quantity' => $value,
                        'note' => $request->get('motif'),
                        'team_id' => null,
                        'user_id' => $request->user()->id,
                    ]);
                } else {
                    $error = true;
                }
            }
        }

        if ($error) {
            return redirect('/in-out.in')->with('error', 'Erreur lors de la mise à jour du stock!');
        } else {
            return redirect('/in-out.in')->with('success', 'Stock mis à jour!');
        }
    }

    public function out_store(Request $request)
    {
        $refs = explode(',', $request->get('refs_list'));
        $datas = [];
        foreach ($refs as $ref) {
            $value = $request->get('val_'.$ref);
            $datas = Arr::add($datas, $ref, $value);
        }
        Arr::forget($datas, '');
        $error = false;
        foreach ($datas as $key => $value) {
            $product = Product::where('reference', $key)->get()->toArray() ;
            if ($product == null) {
                $error = true;
            } else {
                $stock = Stock::where('product_id', $product[0]["id"])->first();
                if ($stock !== null) {
                    $stock->value -= $value;
                    $stock->save();
                    Mouvment::create([
                        'action' => 'OUT',
                        'product_id' => $product[0]["id"],
                        'quantity' => $value,
                        'note' => $request->get('motif')."",
                        'team_member_id' => $request->get('member_id'),
                        'user_id' => $request->user()->id,
                    ]);
                } else {
                    $error = true;
                }
            }
        }

        if ($error) {
            return redirect('/in-out.out')->with('error', 'Erreur lors de la mise à jour du stock!');
        } else {
            return redirect('/in-out.out')->with('success', 'Stock mis à jour!');
        }
    }
}
