<div id="report_table" class="show-print">
    <table border="1" width="100%">
        <thead>
        <tr>
            <th scope="col">رقم الصنف</th>
            <th scope="col">إسم الصنف</th>
            <th scope="col">الوحدة الرئيسية</th>
            <th scope="col">الرصيد</th>
            <th scope="col">آخر حركة</th>
        </tr>
        </thead>
        <tr id="report_table_tr" hidden>
            <td colspan="6" class="text-center">
                حدد موظف أو مخزن لعرض العهد الخاصة به
            </td>
        </tr>
        <tbody id="report_table_body">


        @if(isset($type))
            @if($type == 1)
                @if(isset($data->testaments))

                    @foreach($data->testaments as $testament)
                            <tr>
                                <td>{{ $testament->item->item_number }}</td>
                                <td>{{ $testament->item->name }}</td>
                                <td>{{ $testament->unit->name }}</td>
                                <td>{{ $testament->quantity }}</td>
                                <td>{{ $testament->created_at->toDateString() }}</td>
                            </tr>
                    @endforeach

                @endif
            @else
                @if(count($data->items))
                    @foreach($data->items->where('available_quantity','<>',0) as $item)
                            <tr>
                                <td>{{ $item->item_number }}</td>
                                <td>{{ $item->name }}</td>
                                <td>عدد</td>
                                <td>{{ $item->available_quantity }}</td>
                                <td>{{ count($item->transactions) ? $item->transactions->last()->created_at->toDateString() : "---------" }}</td>
                            </tr>

                    @endforeach
                        @else
                            <tr>
                                <td colspan="6" class="text-center">
                                    حدد موظف أو مخزن لعرض العهد الخاصة به
                                </td>
                            </tr>
                        @endif
                        @endif
                        @else
                            <tr>
                                <td colspan="6" class="text-center">
                                    حدد موظف أو مخزن لعرض العهد الخاصة به
                                </td>
                            </tr>
                        @endif

        </tbody>

    </table>
</div>
