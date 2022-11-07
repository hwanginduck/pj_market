function selectAll(selectAll)  {
  const checkboxes 
       = document.getElementsByName('likeitem');
  
  checkboxes.forEach((checkbox) => {
    checkbox.checked = selectAll.checked;
  })
}