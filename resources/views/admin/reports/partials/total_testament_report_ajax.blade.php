<table border="1" width="100%">
    <thead>
    <tr>
        <th scope="col">رقم الصنف</th>
        <th scope="col">إسم الصنف</th>
        <th scope="col">الرصيد</th>
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
                    @foreach($employee->user->testaments as $testament)
                        @php
                            array_push($testaments,$testament);
                        @endphp
                        <tr>
                            <td>{{ $testament->item->item_number }}</td>
                            <td>{{ $testament->item->name }}</td>
                            <td>{{ $testament->quantity }}</td>
                        </tr>
                    @endforeach
                @endif
            @endforeach
            @if(count($testaments) == 0)
                <tr>
                    <td colspan="3" class="text-center">
                        لايوجد عُهد في هذة {{ $type }}
                    </td>
                </tr>
            @endif
        @else
            <tr>
                <td colspan="3" class="text-center">
                    حدد إدارة أو قسم أو دائرة لعرض العهد الخاصة بها
                </td>
            </tr>
        @endif
    @else
        <tr>
            <td colspan="3" class="text-center">
                حدد إدارة أو قسم أو دائرة لعرض العهد الخاصة بها
            </td>
        </tr>
    @endif
    </tbody>
</table>
