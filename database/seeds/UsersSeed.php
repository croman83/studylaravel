<?php

use Illuminate\Database\Seeder;

class UsersSeed extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('users')->insert([
            'name' => 'Roman',
            'email' => 'casian.roma@gmail.com',
            'password' => bcrypt('romana'),
        ]);
    }
}
