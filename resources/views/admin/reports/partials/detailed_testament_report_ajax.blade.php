<table border="1" width="100%" class="show-print">
    <thead>
    <tr>
        <th scope="col">الرقم</th>
        <th scope="col">الصنف</th>
        <th scope="col">التفصيل</th>
        <th scope="col">الوارد</th>
        <th scope="col">الصادر</th>
    </tr>
    </thead>
    <tbody>
    @php
        $testaments = [];
    @endphp
    @if(isset($data))
        @if(count($data))
            @foreach($data as $employee)
                @if(isset($employee->user->testaments))
                   @if(count($employee->user->testaments))
                       <tr>
                           <td colspan="5"><b>الموظف: </b>{{ $employee->user->name }}</td>
                       </tr>
                   @endif
                    @foreach($employee->user->testaments as $testament)
                        @php
                            array_push($testaments,$testament);
                        @endphp
                        <tr>
                            <td>{{ $testament->item->item_number }}</td>
                            <td>{{ $testament->item->name }}</td>
                            <td>{{ $testament->description ? $testament->description : "عدد: ".$testament->quantity }}</td>
                            <td>{{ $testament->created_at->toDateString() }}</td>
                            <td>{{ $testament->return_testament_date ? $testament->return_testament_date->toDateString() : "دائمة" }}</td>
                        </tr>
                    @endforeach
                @endif
            @endforeach
            @if(count($testaments) == 0)
                <tr>
                    <td colspan="5" class="text-center">
                        لايوجد عُهد في هذة {{ $type }}
                    </td>
                </tr>
            @endif
        @else
            <tr>
                <td colspan="5" class="text-center">
                    حدد إدارة أو قسم أو دائرة لعرض العهد الخاصة بها
                </td>
            </tr>
        @endif
    @else
        <tr>
            <td colspan="5" class="text-center">
                حدد إدارة أو قسم أو دائرة لعرض العهد الخاصة بها
            </td>
        </tr>
    @endif
    </tbody>
</table>
