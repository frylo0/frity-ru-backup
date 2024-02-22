$(button).click(async e => {
   button.textContent = 'Копирую';
   button.classList.add('animation-load');

   const url = `./download.php`;
   console.log(url);
   const gates = await fetch(url).then(res => res.json());
   console.log(gates);

   const time = selectValue(selectTime), 
      type = selectValue(selectType);

   const targetGates = gates[type][time];
   const result = [];
   targetGates.forEach(gate => {
      const date = new Date(gate.dateTime);
      result.push({
         time: date.toLocaleTimeString('ru').slice(0, -3),
         city: gate.direction,
         gate: gate.gate,
      });
   })

   console.log(result);
   const resultStr = result.map(gate => `${gate.time}\t${gate.city}\t${gate.gate}`).join('\n');
   
   console.log(resultStr);
   clipboard(resultStr, e);
   
   button.classList.remove('animation-load');
   button.textContent = 'Готово';
   window.innerWidth;

   setTimeout(() => button.textContent = 'Скопировать гейты', 1000);
});

function selectValue(select) {
   return select.options[select.selectedIndex].value;
}