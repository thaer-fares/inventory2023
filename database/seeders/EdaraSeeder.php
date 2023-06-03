<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class EdaraSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('edaras')->delete();
        DB::table('edaras')->insert([
            [
                "id"=> 944,
                "name"=> "وحدة الشؤون القانونية",
                "parent_id"=> 1301
            ],
            [
                "id"=> 947,
                "name"=> "الادارة العامة للمساجد والمديريات",
                "parent_id"=> 1300
            ],
            [
                "id"=> 948,
                "name"=> "وحدة العلاقات العامة والإعلام",
                "parent_id"=> 1301
            ],
            [
                "id"=> 949,
                "name"=> "وحدة التعليم الشرعي",
                "parent_id"=> 1300
            ],
            [
                "id"=> 955,
                "name"=> "وحدة الزكاة والاغاثة",
                "parent_id"=> 1300
            ],
            [
                "id"=> 966,
                "name"=> "وحدة التخطيط وتطوير الأداء المؤسسي",
                "parent_id"=> 1301
            ],
            [
                "id"=> 967,
                "name"=> "الإدارة العامة للأملاك الوقفية",
                "parent_id"=> 1300
            ],
            [
                "id"=> 972,
                "name"=> "وحدة الحاسوب وتكنولوجيا المعلومات الجديدة",
                "parent_id"=> 1301
            ],
            [
                "id"=> 974,
                "name"=> "الادارة العامة للقرآن الكريم",
                "parent_id"=> 1300
            ],
            [
                "id"=> 977,
                "name"=> "وحدة تنمية أموال الوقف",
                "parent_id"=> 1301
            ],
            [
                "id"=> 1035,
                "name"=> "الادارة العامة للدعوة والارشاد",
                "parent_id"=> 1300
            ],
            [
                "id"=> 1072,
                "name"=> "وحدة الرقابة الداخلية",
                "parent_id"=> 1301
            ],
            [
                "id"=> 1100,
                "name"=> "الادارة العامة للحج والعمرة",
                "parent_id"=> 1300
            ],
            [
                "id"=> 1172,
                "name"=> "الإدارة العامة للشئون الإدارية",
                "parent_id"=> 1300
            ],
            [
                "id"=> 1182,
                "name"=> "الإدارة العامة للشئون المالية",
                "parent_id"=> 1300
            ],
            [
                "id"=> 1206,
                "name"=> "وحدة المشاريع والتعاون الدولي",
                "parent_id"=> 1301
            ],
            [
                "id"=> 1300,
                "name"=> "الوكيل",
                "parent_id"=> 939
            ],
            [
                "id"=> 1301,
                "name"=> "الوزير",
                "parent_id"=> 939
            ],
            [
                "id"=> 1423,
                "name"=> "وحدة شؤون القدس",
                "parent_id"=> 1301
            ]
        ]);
    }
}
