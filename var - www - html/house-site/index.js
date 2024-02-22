$(document).ready(() => {
    window.filters = {};

    //DOUBLE-RANGE
    $('.double-range').each(function () {
        const dr = $(this);
        const line = dr.find('.line');
        let lineRect = line[0].getBoundingClientRect();

        const thumb1 = dr.find('.thumb1');
        const thumb2 = dr.find('.thumb2');
        const thumbs = [thumb1, thumb2];

        const fieldFrom = dr.find('.field_from input');
        const fieldTo = dr.find('.field_to input');

        // debugger; console.log();

        const screenBreak = 500;

        thumbs.forEach(thumb => {
            thumb.on('mousedown', e => {
                if (screen.width > screenBreak) {
                    window.currThumb = thumb;
                    thumb.pressed = true;
                }
            });

            thumb.on('touchstart', e => {
                window.currThumb = thumb;
                thumb.pressed = true;
                lineRect = line[0].getBoundingClientRect();
            });
            thumb.on('touchmove', e => {
                handleFieldsToThumbs(event.changedTouches[0].clientX);
            });
            thumb.on('touchend', e => {
                if (!window.currThumb) return;
                window.currThumb.pressed = false;
            });
        });

        function handleFieldsToThumbs(clientX) {
            if (!window.currThumb) return;
            if (window.currThumb.pressed) {
                // console.log(`${clientX} > ${lineRect.right} ? ${lineRect.width} : ${clientX} - ${lineRect.left}`);
                let left = clientX > lineRect.right ? lineRect.width : clientX - lineRect.left;
                if (left < 0) left = 0;
                window.currThumb[0].style.left = left + 'px';
                let from = Math.round(thumb1.getValueFromPos());
                let to = Math.round(thumb2.getValueFromPos());
                if (to < from) {
                    let temp = to;
                    to = from;
                    from = temp;
                }
                fieldFrom.val(from);
                fieldTo.val(to);
            }
        }

        $(window).on('mousemove', e => {
            if (screen.width > screenBreak) {
                handleFieldsToThumbs(event.clientX);
            }
        });
        $(window).on('mouseup', e => {
            if (screen.width > screenBreak) {
                if (!window.currThumb) return;
                window.currThumb.pressed = false;
            }
        });

        [fieldFrom, fieldTo].forEach(field => {
            field.on('keyup', e => {
                thumb1.setValue(fieldFrom.val());
                thumb2.setValue(fieldTo.val());
            });
            field.on('keydown', e => {
                let val = +field.val();
                if (e.originalEvent.key == 'ArrowUp' && val < dr.max) {
                    field.val(val + 1);
                } else if (e.originalEvent.key == 'ArrowDown' && val > dr.min) {
                    field.val(val - 1);
                }
            });
        });

        const interface = {
            min: +dr[0].dataset.min,
            max: +dr[0].dataset.max,
            thumb1: thumb1,
            thumb2: thumb2,
            fieldFrom: fieldFrom,
            fieldTo: fieldTo,
            init() {
                this.thumb1.setValue = this.thumb2.setValue = function (value) {
                    if (typeof value == "string") {
                        value = parseFloat(value);
                        if (!(value || value === 0)) return null;
                        value = Math.round(value);
                        if (value < dr.min) value = dr.min;
                        if (value > dr.max) value = dr.max;
                    }
                    let left = (value - dr.min) / (dr.max - dr.min) * lineRect.width;
                    this.css('left', left + 'px');
                };

                this.thumb1.getValueFromPos = this.thumb2.getValueFromPos = function () {
                    let left = parseInt(this[0].style.left);
                    let value = left * (dr.max - dr.min) / lineRect.width + dr.min;
                    return value;
                }

                this.thumb1.value = +this.thumb1.attr('data-value');
                this.thumb2.value = +this.thumb2.attr('data-value');

                this.thumb1.setValue(this.fieldFrom.val());
                this.thumb2.setValue(this.fieldTo.val());
            }
        };

        Object.assign(dr, interface);
        dr.init();

        window.filters.doubleRange = dr;
    });

    //FILTERS BLOCK
    let filtersBlock = $('.filters-block')[0];
    let filtersBlockInterface = {
        getFilters() {
            const checkboxes = filtersBlock.querySelectorAll('.checkbox > input');
            const quadrature = window.filters.doubleRange;
            const cityDropdown = filtersBlock.querySelector('.city-dropdown select');
            const roomsAmountField = filtersBlock.querySelector('.rooms-amount .text-field');
            const radioGroupsFirstRadioButton = filtersBlock.querySelectorAll('.radio-button-group .radio-button:nth-child(1) input');

            return {
                rooms: checkboxes[0].checked,
                houses: checkboxes[1].checked,
                primary: checkboxes[2].checked,
                secondary: checkboxes[3].checked,
                quadrature: {
                    from: quadrature.fieldFrom[0].value,
                    to: quadrature.fieldTo[0].value
                },
                city: cityDropdown.value,
                roomsAmount: roomsAmountField.value,
                sortBy: {
                    toBigger: radioGroupsFirstRadioButton[0].checked,
                    orderParam: radioGroupsFirstRadioButton[1].checked ? 'price' : 'quadrature'
                }
            };
        }
    };
    Object.assign(window.filters, filtersBlockInterface);

    $(filtersBlock).find('.filters-block_find-button').click(e => {
        console.log(filters.getFilters());
    });

    $(filtersBlock).find('.toggle-button').click(e => {
        console.log('click')
        filtersBlock.classList.toggle('filters-block_mobile-visible')
    });

    $(filtersBlock).find('.close-button').click(e => {
        console.log('click')
        filtersBlock.classList.toggle('filters-block_mobile-visible')
    });
});