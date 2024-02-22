let modal = sel('#modal');
modal.on('transitionend', () => {
    if (modal.hasclass('modal-hide'))
        modal.style.display = 'none';
});
modal.sel('.modal_background').on.click(e => {
    if (e.target.classList.contains('modal_background'))
        modal.hide();
});
modal.createType = function (typeId, imageSource, typeName) {
    let typesWrapper = modal.sel('.modal_content_person-types');
    let typeBlock = typesWrapper.push.div('person-type-choise')
        .attr('data-person-type-id', typeId);
    typeBlock.on.click(onPersonTypeClick);
    let typeImage = typeBlock.push.img();
    typeImage
        .attr('data-person-type-id', typeId)
        .attr('src', `img/icon/${imageSource}`)
        .attr('title', typeName)
        .attr('alt', typeName);
    return {
        obj: typeBlock,
        image: {
            obj: typeImage,
        },
    };
}
modal.writeNoTypesText = (text = 'У выбранного региона отсутсвуют прикреплённые персоны') => {
    modal.sel('.modal_content_person-types').push('span').textto(text);
};
modal.show = async function (selectedElement) {
    document.body.style.overflow = 'hidden';
    modal.style.display = 'block';
    modal.offsetLeft;
    modal.class('modal-show');
    modal.unclass('modal-hide');
    if (selectedElement) {
        modal.attr('data-region', selectedElement.dataset.name);
        console.log('Selected ' + modal.dataset.region);
    }
    modal.sel('.modal_update-content').htmlto("");
    modal.sel('.modal_content_person-types').htmlto("");
    let response = await fetch('/cim/modal_types_generation.php', {
        method: 'post',
        body: 'region_selector=' + modal.dataset.region,
        headers: {
            'Content-type': 'application/x-www-form-urlencoded',
        },
    });
    
    //console.log(response);
    //let text = await response.text();
    //console.log(text);
    //return;
    
    let types = await response.json();
    //console.log(types);
    
    if (!types || types.length == 0) {
        modal.writeNoTypesText();
        return;
    }
    types.forEach(type => {
        modal.createType(type.id_type, type.type_image, type.type_name);
    });
};
modal.hide = function (selectedElement) {
    document.body.style.overflow = 'default';
    modal.class('modal-hide');
    modal.unclass('modal-show');
    modal.sela('.person-type-choise').forEach(el=>el.unclass('selected'));
};

function onPersonTypeClick(e) {
    event.stopPropagation();
    let personTypes = sela('.person-type-choise');
    personTypes.forEach(el => el.unclass('selected'));
    e.target.parentElement.class('selected');
    // console.log(`Clicked choise type of ${e.target.dataset.personType}`);
    let req = cre.post('get-data.php');
    req.ok = () => {
        if (!req.responseText) return;
        let response = req.responseText;
        //console.log(response);
        requestResolve(response);
    };
    req.err = () => { 
        if (!req.responseText) {
            console.log('Request status text: '+req.statusText);
            requestResolve('[{"person_name":"Ошибка на сервере. Ничего не найдено", "person_pag":"#"}]');
            return; 
        }
        else alert(req.responseText+'\n'+req.statusText);
    };
    req.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    let reqBody = `region=${modal.dataset.region}&type=${e.target.dataset.personTypeId}`;
    // console.log(reqBody);
    req.send(reqBody);
}