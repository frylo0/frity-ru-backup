function requestResolve(requestJSON) {
    //console.log(requestJSON);
    let persons = JSON.parse(requestJSON);
    // console.log(persons);

    let modal_updtate_content = modal.sel('.modal_update-content').htmlto('');

    persons.forEach(person => {
        let person_block = cre.div().class('modal_update-content_person', 'flex-row')
            .push.a();
        if (person.person_page != '#') {
            person_block.attr('href', `show-page.php?page=${person.person_page_way + person.person_page}`);
        } else {
            person_block.attr('href', 'javascript:void(0)');
        }
        person_block.push.span('person_surname').textto(person.person_surname);
        person_block.push.span('person_name').textto(person.person_name);
        person_block.push.span('person_secondname').textto(person.person_secondname);
        modal_updtate_content.append(person_block);
    });

}