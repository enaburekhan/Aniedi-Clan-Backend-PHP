<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\patientapp;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('patientapps', function() {
    // If the Content-Type and Accept headers are set to 'application/json', 
    // this will return a JSON structure. This will be cleaned up later.
    return patientapp::all();
});
 
Route::get('patientapps/{id}', function($id) {
    return patientapp::find($id);
});

Route::post('patientapps', function(Request $request) {
    return patientapp::create($request->all);
});

Route::put('patientapps/{id}', function(Request $request, $id) {
    $patient = patientapp::findOrFail($id);
    $patient->update($request->all());

    return $patient;
});

Route::delete('patientapps/{id}', function($id) {
    patientapp::find($id)->delete();

    return 204;
});

Route::get('patientapps', 'patientappController@index');
Route::get('patientapps/{patientapp}', 'patientappController@show');
Route::post('patientapps', 'patientappController@store');
Route::put('patientapps/{patientapp}', 'patientappController@update');
Route::delete('patientapps/{patientapp}', 'patientappController@delete');

Route::post(register, 'Auth\RegisterController@register');
Route::post('login', 'Auth\LoginController@login');