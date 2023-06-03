<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class DepartmentSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('departments')->delete();
        DB::table('departments')->insert( [
            [
                "id"=> 945,
                "name"=> "قسم القضايا",
                "parent_id"=> 944
            ],
            [
                "id"=> 951,
                "name"=> "المدرسة الشرعية للبنات - خانيونس",
                "parent_id"=> 950
            ],
            [
                "id"=> 957,
                "name"=> "قسم الخدمات المساندة الوسطى",
                "parent_id"=> 956
            ],
            [
                "id"=> 969,
                "name"=> "قسم نظم المعلومات الجغرافية والمساحة",
                "parent_id"=> 968
            ],
            [
                "id"=> 971,
                "name"=> "قسم المونتاج",
                "parent_id"=> 970
            ],
            [
                "id"=> 976,
                "name"=> "قسم العمل المؤقت",
                "parent_id"=> 975
            ],
            [
                "id"=> 979,
                "name"=> "قسم خدمات الويب وتكامل البيانات",
                "parent_id"=> 978
            ],
            [
                "id"=> 981,
                "name"=> "قسم العمل النسائي",
                "parent_id"=> 980
            ],
            [
                "id"=> 983,
                "name"=> "قسم العمل النسائي غزة",
                "parent_id"=> 952
            ],
            [
                "id"=> 986,
                "name"=> "قسم الصيانة العامة",
                "parent_id"=> 985
            ],
            [
                "id"=> 988,
                "name"=> "قسم العمل النسائي",
                "parent_id"=> 987
            ],
            [
                "id"=> 990,
                "name"=> "قسم القرآن الكريم -ذكور الوسطى",
                "parent_id"=> 956
            ],
            [
                "id"=> 993,
                "name"=> "قسم العمل النسائي الوسطى",
                "parent_id"=> 956
            ],
            [
                "id"=> 996,
                "name"=> "قسم متابعة المساجد الوسطى",
                "parent_id"=> 956
            ],
            [
                "id"=> 1000,
                "name"=> "قسم متابعة المساجد",
                "parent_id"=> 987
            ],
            [
                "id"=> 1001,
                "name"=> "قسم متابعة المساجد",
                "parent_id"=> 952
            ],
            [
                "id"=> 1005,
                "name"=> "قسم إدارة أنظمة التشغيل",
                "parent_id"=> 1004
            ],
            [
                "id"=> 1008,
                "name"=> "قسم متابعة المساجد",
                "parent_id"=> 961
            ],
            [
                "id"=> 1009,
                "name"=> "قسم متابعة المساجد",
                "parent_id"=> 980
            ],
            [
                "id"=> 1010,
                "name"=> "قسم القرآن الكريم -ذكور",
                "parent_id"=> 987
            ],
            [
                "id"=> 1011,
                "name"=> "قسم الخدمات المساندة غزة",
                "parent_id"=> 952
            ],
            [
                "id"=> 1015,
                "name"=> "قسم الصيانة والدعم الفني وإدارة الشبكات",
                "parent_id"=> 1004
            ],
            [
                "id"=> 1017,
                "name"=> "قسم القرآن الكريم -ذكور",
                "parent_id"=> 980
            ],
            [
                "id"=> 1027,
                "name"=> "قسم البرامج",
                "parent_id"=> 1026
            ],
            [
                "id"=> 1030,
                "name"=> "قسم متابعة المديريات",
                "parent_id"=> 1029
            ],
            [
                "id"=> 1032,
                "name"=> "قسم الاصدارات والمطبوعات",
                "parent_id"=> 1031
            ],
            [
                "id"=> 1037,
                "name"=> "قسم الدعوة الالكترونية",
                "parent_id"=> 1036
            ],
            [
                "id"=> 1039,
                "name"=> "قسم العهد",
                "parent_id"=> 1038
            ],
            [
                "id"=> 1043,
                "name"=> "قسم الخزينة",
                "parent_id"=> 1042
            ],
            [
                "id"=> 1046,
                "name"=> "قسم العمل النسائي",
                "parent_id"=> 961
            ],
            [
                "id"=> 1049,
                "name"=> "قسم الكفالات",
                "parent_id"=> 1048
            ],
            [
                "id"=> 1050,
                "name"=> "قسم هندسة الصوت",
                "parent_id"=> 1026
            ],
            [
                "id"=> 1052,
                "name"=> "المدرسة الشرعية للبنين - غزة",
                "parent_id"=> 950
            ],
            [
                "id"=> 1053,
                "name"=> "قسم القرآن الكريم -ذكور غزة",
                "parent_id"=> 952
            ],
            [
                "id"=> 1063,
                "name"=> "الأقسام الأكاديمية",
                "parent_id"=> 1399
            ],
            [
                "id"=> 1066,
                "name"=> "قسم الدوام والاجازات",
                "parent_id"=> 975
            ],
            [
                "id"=> 1068,
                "name"=> "قسم المخازن الرئيسية والفرعية",
                "parent_id"=> 1038
            ],
            [
                "id"=> 1070,
                "name"=> "قسم الأئمة",
                "parent_id"=> 1069
            ],
            [
                "id"=> 1074,
                "name"=> "قسم الرقابة الفنية",
                "parent_id"=> 1091
            ],
            [
                "id"=> 1076,
                "name"=> "قسم القرآن الكريم -ذكور",
                "parent_id"=> 961
            ],
            [
                "id"=> 1080,
                "name"=> "قسم القناة الالكترونية",
                "parent_id"=> 1026
            ],
            [
                "id"=> 1081,
                "name"=> "قسم الأملاك",
                "parent_id"=> 961
            ],
            [
                "id"=> 1082,
                "name"=> "قسم الخدمات المساندة",
                "parent_id"=> 961
            ],
            [
                "id"=> 1085,
                "name"=> "قسم البرامج والمناهج",
                "parent_id"=> 1084
            ],
            [
                "id"=> 1086,
                "name"=> "قسم الخدمات المساندة",
                "parent_id"=> 980
            ],
            [
                "id"=> 1089,
                "name"=> "قسم التخطيط والبرامج",
                "parent_id"=> 1088
            ],
            [
                "id"=> 1096,
                "name"=> "الأقسام الأكاديمية",
                "parent_id"=> 1414
            ],
            [
                "id"=> 1099,
                "name"=> "قسم الأملاك",
                "parent_id"=> 980
            ],
            [
                "id"=> 1102,
                "name"=> "قسم معلومات الحج والعمرة",
                "parent_id"=> 1101
            ],
            [
                "id"=> 1103,
                "name"=> "قسم المتابعة والتفتيش",
                "parent_id"=> 968
            ],
            [
                "id"=> 1106,
                "name"=> "قسم الاحصاء والمعلومات",
                "parent_id"=> 1088
            ],
            [
                "id"=> 1107,
                "name"=> "قسم شؤون الموظفين",
                "parent_id"=> 1415
            ],
            [
                "id"=> 1109,
                "name"=> "قسم التنسيق والمتابعة",
                "parent_id"=> 1026
            ],
            [
                "id"=> 1111,
                "name"=> "قسم الدورات والقراءة والإقراء",
                "parent_id"=> 1110
            ],
            [
                "id"=> 1113,
                "name"=> "قسم الخدمات المساندة",
                "parent_id"=> 987
            ],
            [
                "id"=> 1115,
                "name"=> "قسم المخطوطات",
                "parent_id"=> 1105
            ],
            [
                "id"=> 1118,
                "name"=> "قسم متابعة الأملاك",
                "parent_id"=> 1117
            ],
            [
                "id"=> 1123,
                "name"=> "قسم شؤون الطلبة",
                "parent_id"=> 1399
            ],
            [
                "id"=> 1127,
                "name"=> "قسم الأملاك غزة",
                "parent_id"=> 952
            ],
            [
                "id"=> 1128,
                "name"=> "قسم السكرتاريا والأرشيف مكتب الوزير",
                "parent_id"=> 1181
            ],
            [
                "id"=> 1129,
                "name"=> "قسم قواعد بيانات الوقف",
                "parent_id"=> 1117
            ],
            [
                "id"=> 1132,
                "name"=> "قسم أمن خوادم الويب والبيانات",
                "parent_id"=> 1131
            ],
            [
                "id"=> 1134,
                "name"=> "قسم الورش",
                "parent_id"=> 985
            ],
            [
                "id"=> 1135,
                "name"=> "قسم الخدمات الادارية",
                "parent_id"=> 1097
            ],
            [
                "id"=> 1137,
                "name"=> "قسم الاشراف الهندسي",
                "parent_id"=> 968
            ],
            [
                "id"=> 1141,
                "name"=> "قسم المحاسبة",
                "parent_id"=> 1042
            ],
            [
                "id"=> 1144,
                "name"=> "قسم تحليل وتصميم النظم وإدارة قواعد البيانات",
                "parent_id"=> 1131
            ],
            [
                "id"=> 1147,
                "name"=> "قسم المشتريات",
                "parent_id"=> 1146
            ],
            [
                "id"=> 1148,
                "name"=> "قسم النقل والمواصلات",
                "parent_id"=> 1097
            ],
            [
                "id"=> 1149,
                "name"=> "قسم الرقابة الادارية",
                "parent_id"=> 1091
            ],
            [
                "id"=> 1153,
                "name"=> "قسم الاستثمار المالي",
                "parent_id"=> 1152
            ],
            [
                "id"=> 1154,
                "name"=> "قسم الأملاك الوسطى",
                "parent_id"=> 956
            ]
        ]);
    }
}
