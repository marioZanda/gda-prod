function addCell(tr){
    var td = tr.insertCell();
    return td;
}

function createInput(type,id,name,value,disable,max){
    var disable = (disable)?"readonly":"";
    var min = (type == "number")?"min='0'":"";
    var max = (type == "number" && max != undefined)?"max='"+max+"'":"";
    return "<input class='form-control' type='"+type+"'"+min+" "+max+" id='"+id+"' name='"+name+"' value='"+value+"' "+disable+"></input>";
}

function loadIn(){
    let selected = new Map;
    var table = document.getElementById('entries');
    var input = document.getElementById('refs');

    input.addEventListener('change', updateValue);
    function treat_in(product){
        if(product.length !== 0){
            data = product[0];
            if(selected.has(data.reference)){
                selected.set(data.reference, selected.get(data.reference)+1);
                incValue(data);
            }else{
                selected.set(data.reference,1);
                addTable(data);
                refs_list.value += data.reference+",";
            }
        }else{
            alert('Réference inconnue');
        }
    }

    function addTable(data){
        var row = table.insertRow();

        var cell = addCell(row);
        cell.innerHTML = createInput("text", "ref_"+data.reference, "ref_"+data.reference, data.reference, true );
        cell = addCell(row);
        cell.innerHTML = createInput("text", "name_"+data.reference, "name_"+data.reference, data.name, true );
        cell = addCell(row);
        cell.innerHTML = createInput("text", "brand_"+data.reference, "brand_"+data.reference, data.brand, true );
        cell = addCell(row);
        cell.innerHTML = createInput("number", "val_"+data.reference, "val_"+data.reference, selected.get(data.reference), false );

    }


    function incValue(data){
        document.getElementById('val_'+data.reference).value = selected.get(data.reference);
    }

    function updateValue(e) {
        if(document.getElementById("submitBtn").disabled){
            document.getElementById("submitBtn").disabled = false;
        }
        var ref = e.target.value;
        e.target.value ="";
        fetch(`in-out.in/${ref}`).then(response => response.json())
            .then(product => treat_in(product)).catch((error) => {
                console.log(error)
        });
    }
}

function loadOut(){
    let selected = new Map;
    var table = document.getElementById('entries');
    var input = document.getElementById('refs');
    var team_member_input = document.getElementById('team_member');
    var team_member = document.getElementById('member');
    var member_id = document.getElementById('member_id');

    input.addEventListener('change', updateValue);
    team_member_input.addEventListener('change', getTm);
    function treat_out(product){
        if(product.length !== 0){
            data = product[0];
            if(selected.has(data.reference)){
                selected.set(data.reference, selected.get(data.reference)+1);
                incValue(data);
            }else{
                selected.set(data.reference,1);
                addTable(data);
                refs_list.value += data.reference+",";
            }
        }else{
            alert('Réference inconnue');
        }
    }

    function addTable(data){
        var row = table.insertRow();

        var cell = addCell(row);
        cell.innerHTML = createInput("text", "ref_"+data.reference, "ref_"+data.reference, data.reference, true );
        cell = addCell(row);
        cell.innerHTML = createInput("text", "name_"+data.reference, "name_"+data.reference, data.name, true );
        cell = addCell(row);
        cell.innerHTML = createInput("text", "brand_"+data.reference, "brand_"+data.reference, data.brand, true );
        cell = addCell(row);
        cell.innerHTML = createInput("number", "val_"+data.reference, "val_"+data.reference, selected.get(data.reference), false , data.stock.value);
        cell = addCell(row);
        cell.innerHTML = createInput("text", "team_"+data.reference, "team_"+data.reference, team_member.innerText, true );

    }

    function incValue(data){
        document.getElementById('val_'+data.reference).value = selected.get(data.reference);
    }

    function updateValue(e) {
        if(document.getElementById("submitBtn").disabled){
            document.getElementById("submitBtn").disabled = false;
        }
        var ref = e.target.value;
        e.target.value ="";
        fetch(`in-out.out/${ref}`).then(response => response.json())
            .then(product => treat_out(product)).catch((error) => {
                console.log(error)
        });
    }
    function getTm(e) {
        var ref = e.target.value;
        e.target.value ="";
        fetch(`in-out.out.team/${ref}`).then(response => response.json())
            .then(member => treat_tm(member)).catch((error) => {
                console.log(error)
        });
    }

    function treat_tm(member){
        if(member.length !== 0){
            data = member[0];
            console.log(data);
            team_member.innerText = data.firstname + " " + data.lastname;
            member_id.value = data.id;
            input.disabled = false;
            team_member_input.disabled = true;
        }else{
            alert('Membre inconnu');
        }
    }
}
