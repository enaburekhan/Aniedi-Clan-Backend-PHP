<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\patientapp;

class patientappcontroller extends Controller
{
    public function index()
    {
        return patientapp::all();
    }

    public function show(patientapp $patientapp)
    {
        return $patientapp;
    }

    public function store(Request $request)
    {
        $patientapp = patientapp::create($request->all());

        return response()->json($patientapp, 201);
    }

    public function update(Request $request, Article $patientapp)
    {
        $patientapp->update($request->all());

        return response()->json($patientapp, 200);
    }

    public function delete(patientapp $patientapp)
    {
        $patientapp->delete();

        return response()->json(null, 204);
    }

}
