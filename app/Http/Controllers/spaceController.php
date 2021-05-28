<?php

namespace App\Http\Controllers;

use PDO;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Config;
use Illuminate\Http\Request;

class spaceController extends Controller
{
    public function change(Request $request)
    {
        $db = "db_".$request->get('agence');
        updateDotEnv('DB_DATABASE', $db);
        return back();
    }
}

function updateDotEnv($key, $newValue, $delim='')
{
    $path = base_path('.env');
    // get old value from current env
    $oldValue = env($key);

    // was there any change?
    if ($oldValue === $newValue) {
        return;
    }

    // rewrite file content with changed data
    if (file_exists($path)) {
        // replace current value with new value
        file_put_contents(
            $path,
            str_replace(
                $key.'='.$delim.$oldValue.$delim,
                $key.'='.$delim.$newValue.$delim,
                file_get_contents($path)
            )
        );
    }
}
