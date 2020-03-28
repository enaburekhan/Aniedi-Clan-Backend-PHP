<?php

use Illuminate\Database\Seeder;
use App\patientapp;

class patientappTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
      
    {
        //lets truncate our existing records to start from scratch
        patientapp::truncate();

        //let's create a few patients in our database:
        for ($i=0; $i < 50; $i++) {
            patientapp::create ([
                'title' => $faker->sentence,
                'body' => $faker->paragraph,
            ]);
        }
    }

}
