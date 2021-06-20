<%@ page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>


<table class="table table-hover">
	<thead>
		<tr>
			<th>Id</th>
			<th>Name</th>
			<th>Unit Price</th>
			<th>Discount</th>
			<th>Quantity</th>
			<th>Product Date</th>
		</tr>
	</thead>
	<tbody id="tbody">

	</tbody>
</table>

<ul class="pager">
  <li><a href="#"><i class="glyphicon glyphicon-hand-up"></i></a></li>
  <li><a href="#"><i class="glyphicon glyphicon-hand-left"></i></a></li>
  <li><a href="#"><span id="info"></span></a></li>
  <li><a href="#"><i class="glyphicon glyphicon-hand-right"></i></a></li>
  <li><a href="#"><i class="glyphicon glyphicon-hand-down"></i></a></li>
</ul>

<script>
$(function(){
    var pageNo = 0;
    var pageCount = 0;
    var pageSize = 10;

    $.ajax({
         url:'/pager/product/page-count',
         success:function(response){
            pageCount = response;
            $(".pager a:eq(0)").click();
         }
    })

    $(".pager a:eq(0)").click(function(){
        pageNo = 0;
        $.ajax({
            url:'/pager/product/page/' + pageNo,
            success:fnSuccess
        })
        return false;
    });


    $(".pager a:eq(1)").click(function(){
        if(pageNo > 0) {
            pageNo--;
            $.ajax({
                 url:'/pager/product/page/' + pageNo,
                 success:fnSuccess
            })
        }
        return false;
    });

    $(".pager a:eq(3)").click(function(){
        if(pageNo < pageCount - 1) {
             pageNo++;
             $.ajax({
                  url:'/pager/product/page/' + pageNo,
                  success:fnSuccess
             })
        }
        return false;
    });

    $(".pager a:eq(4)").click(function(){
        pageNo = pageCount - 1;
        $.ajax({
            url:'/pager/product/page/' + pageNo,
            success:fnSuccess
        })
        return false;
    });

    function fnSuccess(response){
        $("#tbody").html("");
            $(response).each(function(index, product){
            var tr = $("<tr/>");
            $("<td/>").html(product.id).appendTo(tr);
            $("<td/>").html(product.name).appendTo(tr);
            $("<td/>").html(product.unitPrice).appendTo(tr);
            $("<td/>").html(product.discount).appendTo(tr);
            $("<td/>").html(product.quantity).appendTo(tr);
            $("<td/>").html(product.productDate).appendTo(tr);
                var s = `<td class="text-center">
                    <a class="btn btn-sm btn-info" href="/admin/product/edit/`+product.id+`">Edit</a>
                    <a class="btn btn-sm btn-danger" href="/admin/product/delete/`+product.id+`">Delete</a>
                         </td>`;
            $(s).appendTo(tr);
            tr.appendTo("tbody")
            $("#info").html((pageNo+1)+'/'+pageCount);
        })
    }
})
</script>
