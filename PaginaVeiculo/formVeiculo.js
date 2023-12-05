const modal = document.querySelector('.modal-container');
const tbody = document.querySelector('tbody');
const sCod = document.querySelector('#m-cod');
const sPlaca = document.querySelector('#m-placa');
const sModelo = document.querySelector('#m-modelo')

let itens
let id

function openModal(edit = false, index = 0) {
        modal.classList.add('active')

        modal.onclick = e => {
            if (e.target.className.indexOf('modal-container') !== -1){
                modal.classList.add('active')
            }
        }

        if (edit) {
            sCod.value = itens[index].cod
            sPlaca.value = itens[index].placa
            sModelo.value = itens[index].modelo
            id = index
          } else {
            sCod.value = ''
            sPlaca.value = ''
            sModelo.value = ''
          }
          
        }
        
        function editItem(index) {
        
          openModal(true, index)
        }
        
        function deleteItem(index) {
          itens.splice(index, 1)
          setItensBD()
          loadItens()
        }
        
        function insertItem(item, index) {
          let tr = document.createElement('tr')
        
          tr.innerHTML = `
            <td>${item.cod}</td>
            <td>${item.placa}</td>
            <td>R$ ${item.modelo}</td>
            <td class="acao">
              <button onclick="editItem(${index})"><i class='bx bx-edit' ></i></button>
            </td>
            <td class="acao">
              <button onclick="deleteItem(${index})"><i class='bx bx-trash'></i></button>
            </td>
          `
          tbody.appendChild(tr)
        }
        
        btnSalvar.onclick = e => {
          
          if (sCod.value == '' || sPlaca.value == '' || sModelo.value == '') {
            return
          }
        
          e.preventDefault();
        
          if (id !== undefined) {
            itens[id].cod = sCod.value
            itens[id].placa = sPlaca.value
            itens[id].modelo = sModelo.value
          } else {
            itens.push({'cod': sCod.value, 'placa': sPlaca.value, 'modelo': sModelo.value})
          }
        
          setItensBD()
        
          modal.classList.remove('active')
          loadItens()
          id = undefined
        }
        
        function loadItens() {
          itens = getItensBD()
          tbody.innerHTML = ''
          itens.forEach((item, index) => {
            insertItem(item, index)
          })
        
        }
        
        const getItensBD = () => JSON.parse(localStorage.getItem('dbfunc')) ?? []
        const setItensBD = () => localStorage.setItem('dbfunc', JSON.stringify(itens))
        
        loadItens()