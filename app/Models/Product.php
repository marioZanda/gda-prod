<?php

namespace App\Models;

use Illuminate\Support\Arr;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use App\Models\Supplier;
use App\Models\Stock;
use App\Models\Client;

class Product extends Model
{
    use HasFactory;


    protected $fillable = [
        'reference',
        'name',
        'brand',
        'alert',
        'supplier_id',
        'price',
        'nature',
        'service',
        'unit',
    ];

    public static $sn = array(
        'Aucune' => array('aucune'),
        'Menuiserie' => array('Bois','Panneaux','Dalles','Serrures'),
        'Peinture' => array('Peinture', 'Colle','Enduits / Fixateurs','Toiles','Papiers Peints','Intisse','Brosses','Rouleaux','Lames','Trucs au sol','Lissages
        '),
        'Sol' => array('Linos'),
        'MultiService' => array('Meubles','Eviers','Robinets','Serrures','Garnitures/outillages'),
    );

    public static function getServiceAndNAture()
    {
        return self::$sn;
    }

    public static function getServices()
    {
        [$keys, $values] = Arr::divide(self::$sn);
        return $keys;
    }

    public static function getNats()
    {
        [$keys, $values] = Arr::divide(self::$sn);
        return $values;
    }

    public static function getNatures($service)
    {
        return Arr::get(self::$sn, $service);
    }


    public static function getUnits()
    {
        return array('L','mL','kg','rlx','pcs','m2','tine','rouleau');
    }

    public function supplier()
    {
        $supplier = $this->belongsTo(Supplier::class);
        return $supplier;
    }

    public function stock()
    {
        $stock = $this->hasone(Stock::class);
        return $stock;
    }

    public function clients()
    {
        return $this->belongsToMany(Client::class, 'client_product');
    }
}
