function clipboard(text, e) {
   function fallbackCopyTextToClipboard(text) {
      var textArea = document.createElement("textarea");
      textArea.value = text;

      // Avoid scrolling to bottom
      textArea.style.top = "0";
      textArea.style.left = "0";
      textArea.style.position = "fixed";

      document.body.appendChild(textArea);
      textArea.focus();
      textArea.select();

      try {
         var successful = document.execCommand('copy');
         var msg = successful ? 'successful' : 'unsuccessful';
         console.log('Fallback: Copying text command was ' + msg);
      } catch (err) {
         console.error('Fallback: Oops, unable to copy', err);
      }

      document.body.removeChild(textArea);
   };
   function copyTextToClipboard(text) {
      if (!navigator.clipboard) {
         fallbackCopyTextToClipboard(text);
         return;
      }
      navigator.clipboard.writeText(text).then(function () {
         console.log('Async: Copying to clipboard was successful!');
      }, function (err) {
         console.error('Async: Could not copy text: ', err);
      });
   }

   console.log(`text: ${text}`);
   copyTextToClipboard(text);

   let al = new Notification('Скопировано в буфер обмена', { body: 'Теперь вы можете вставить ссылку себе в работу)' });
   setTimeout(() => al.close(), 1000);
   let notif = document.createElement('div');
   notif.textContent = 'Скопировано в буфер обмена';
   console.log(e);
   notif.style.cssText = `position: absolute; left: 50%; top: calc(50% + 3em); background: white; border: none; opacity: 0.75; padding: 0.5em; z-index: 2000; font-family: sans-serif; border-radius: 5px 0 5px 5px; transform: translate(-50%, -50%);`;
   notif.animate([
      {opacity: 0},
      {opacity: 1}
   ], 500);
   setTimeout(async () => {
      const animation = notif.animate([
         {opacity: 1},
         {opacity: 0}
      ], 500);
      await animation.finished;
      notif.remove();
   }, 3000);
   document.body.append(notif);
}