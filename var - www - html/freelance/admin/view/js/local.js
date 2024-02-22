function dropOrder(elem) {
    sel(elem);
    let yes = confirm("Дествительно удалить заказ от " + elem.sel('.name').textContent);
    if (yes) {
        let req = cre.post('/admin/drop_order.php');
        req.ok = (request) => {
            elem.remove();
        };
        req.err = (request) => {
            alert('Произошла ошибка при удалении заказа: ' + req.responseText);
            console.log(req.responseText);
        };
        req.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
        let id_order = elem.dataset.idOrder;
        req.send("id_order=" + id_order);
    }
}