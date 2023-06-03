<table border="1" width="100%">
    <thead>
    <tr>
        <th scope="col">الرصيد</th>
        <th scope="col">وارد</th>
        <th scope="col">صادر</th>
        <th scope="col">نقل من</th>
        <th scope="col">نقل إلى</th>
        <th scope="col">التاريخ</th>
        <th scope="col">البيان</th>
    </tr>
    </thead>
    <tbody>
        @if(count($transactions) > 0)
            @foreach($transactions as $transaction)
                <tr>
                    <td>{{ $transaction->testament->first()->quantity }}</td>
                    <td>-</td>
                    <td>-</td>
                    @if($transaction->type == 1 )
                        <td>{{ $transaction->_old_store->name }}</td>
                        <td>{{ $transaction->_new_user->name }}</td>
                    @endif
                    @if($transaction->type == 2 )
                        <td>{{ $transaction->_old_user->name }}</td>
                        <td>{{ $transaction->_new_user->name }}</td>
                    @endif
                    @if($transaction->type == 3 )
                        <td>{{ $transaction->_old_user->name }}</td>
                        <td>{{ $transaction->_new_store->name }}</td>
                    @endif
                    @if($transaction->type == 4 )
                        <td>{{ $transaction->_old_store->name }}</td>
                        <td>{{ $transaction->_new_store->name }}</td>
                    @endif
                    <td>{{ $transaction->created_at->format('Y-m-d') }}</td>
                    <td>{{ $transaction->description }}</td>
                </tr>
            @endforeach
        @else
            <tr>
                <td colspan="7" class="text-center">
                    حدد صنف لتحديد حركات هذا الصنف
                </td>
            </tr>
        @endif

    </tbody>
</table>
