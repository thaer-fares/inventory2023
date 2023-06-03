


var Testaments = function () {

    var view_tbl;
    var view_url = base_url + prefix + '/testaments';
    var list_url = base_url + prefix + '/testaments/list';
    var table_id = '#testaments_table';
    /////////////////// View //////////////////
    ///////////////U////////////////////////////
    var viewTable = function () {
        var link = list_url;
        var columns = [
            {"data": "id", "title": "#", "orderable": true, "searchable": false},
            {"data": "user_id", "orderable": false, "searchable": true},
            {"data": "testament", "orderable": false, "searchable": true},
            {"data": "unit", "orderable": false, "searchable": false},
            {"data": "quantity", "orderable": true, "searchable": false},
            {"data": "testament_status", "orderable": true, "searchable": true},
            {"data": "actions", "orderable": false, "searchable": false, "class" : "text-center"}
        ];
        var perPage = 25;
        var order = [[0, 'desc']];

        var ajaxFilter = function (d) {
            d.testament_status = $('#testament_status').val();
            d.user = $('#user').val();
        };

        view_tbl = DataTable.init($(table_id), link, columns, order, ajaxFilter, perPage);
    };
    /////////////////// ADD ///////////////////
    ///////////////////////////////////////////
    var add = function () {
        $('#frmAdd').submit(function(e) {
            e.preventDefault();
            var link = $(this).attr('action');
            // var formData = $(this).formData();
            var formData = new FormData(this);
            var method = $(this).attr('method');

            Forms.doAction(link, formData, method, null, addCallBack);
        });
    };

    var addCallBack = function (obj) {
        if(obj.code === 200) {
            var delay = 1750;

            setTimeout(function () {
                window.location = view_url;
            }, delay);
        }
    };
    /////////////////// EDIT //////////////////
    ///////////////////////////////////////////
    var edit = function () {
        $('#frmEdit').submit(function(e) {
            e.preventDefault();
            var link = $(this).attr('action');
            // var formData = $(this).serialize();
            // var formData = $(this).formData();
             var formData = new FormData(this);
            var method = $(this).attr('method');
            Forms.doAction(link, formData, method, null, editCallBack);
        });
    };

    var editCallBack = function (obj) {
        if(obj.code === 200) {
            var delay = 1750;

            setTimeout(function () {
                window.location = view_url;
            }, delay);
        }
    };
    //////////////// DELETE ///////////////////
    ///////////////////////////////////////////
    var deleteItem = function () {
        $(document).on('click', '.delete_btn', function (e) {
            e.preventDefault();
            var btn = $(this);

            Common.confirm(function() {
                var link = btn.data('url');
                var formData = {};
                var method = "GET";

                Forms.doAction(link, formData, method, view_tbl);
            });
        });
    };

    //////////////// Search ///////////////////
    ///////////////////////////////////////////
    var search = function () {
        $('.searchable').on('input change', function (e) {
            e.preventDefault();
            view_tbl.draw(false);
        });

        $('.search').on('click', function (e) {
            e.preventDefault();
            view_tbl.draw(false);
        });

        $('#frmSearch').keydown(function (e) {
            if (e.keyCode == 13) {
                e.preventDefault();
                view_tbl.draw(false);
            }
        });
    };
    ///////////////// INITIALIZE //////////////
    ///////////////////////////////////////////
    return {
        init: function () {
            viewTable();
            add();
            edit();
            deleteItem();
            search();
        }
    }
}();

$(document).ready(function() {
    Testaments.init();
});