/*!
    * Start Bootstrap - SB Admin v7.0.5 (https://startbootstrap.com/template/sb-admin)
    * Copyright 2013-2022 Start Bootstrap
    * Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-sb-admin/blob/master/LICENSE)
    */
//
// Scripts
//

window.addEventListener('DOMContentLoaded', event => {

    // Toggle the side navigation
    const sidebarToggle = document.body.querySelector('#sidebarToggle');
    if (sidebarToggle) {
        // Uncomment Below to persist sidebar toggle between refreshes
        // if (localStorage.getItem('sb|sidebar-toggle') === 'true') {
        //     document.body.classList.toggle('sb-sidenav-toggled');
        // }
        sidebarToggle.addEventListener('click', event => {
            event.preventDefault();
            document.body.classList.toggle('sb-sidenav-toggled');
            localStorage.setItem('sb|sidebar-toggle', document.body.classList.contains('sb-sidenav-toggled'));
        });
    }

});


window.addEventListener('DOMContentLoaded', event => {
    // Simple-DataTables
    // https://github.com/fiduswriter/Simple-DataTables/wiki
    let dataTable
    const datatablesSimple = document.getElementById('partnerDataTable');
    if (datatablesSimple) {
        dataTable = new simpleDatatables.DataTable(datatablesSimple);
    }
    /*dataTable.rows.add(newRows);*/

    let addNewColumn = function() {

        let columnDataUrl
        if(partnerObj.partnerNo == "") {
            columnDataUrl = "/getPartnerReceivedDmList.do";
        } else {
            columnDataUrl = "/getPartnerReceivedDmList.do?partnerNo=" + partnerObj.partnerNo;
        }

        let newData = [];

        $.ajax({
            url : columnDataUrl,
            dataType: 'json',
            async : false,
            success : function(data) {
                console.log(data);
                for(let i=0; i<data.length; i++) {
                    const dataObj = {};
                    //const readChk = data[i].readCheck = 1 ? "답변대기" : "답변완료";
                    let dmType = data[i].dmType;
                    switch (dmType){
                        case 0 :
                            dmType = '결제/취소';
                            break;
                        case 1 :
                            dmType = '예약/취소';
                            break;
                        case 2 :
                            dmType = '기타문의';
                            break;
                    }

                    dataObj["DM-NO"] = data[i].dmNo;
                    dataObj["보낸사람"] = data[i].sender;
                    // dataObj["DM 구분"] = data[i].senderCategory;
                    // dataObj["받는사람"] = data[i].receiver;
                    dataObj["내용"] = data[i].dmContent;
                    dataObj["보낸날짜"] = data[i].dmDate;
                    if(data[i].readCheck == 1) {
                        dataObj["답변여부"] = "답변완료";
                    } else {
                        dataObj["답변여부"] = "답변대기";
                    }

                    // dataObj["DM 유형"] = dmType;
                    // dataObj["reply"] = data[i].dmType;
                    newData.push(dataObj);
                }
                dataTable.insert(newData);
            }
        })

    }

    addNewColumn();

    dataTable.on('datatable.page', function(page) {
        setDataTable();
    });
    dataTable.on('datatable.sort', function(column, direction) {
        setDataTable();
    });
    dataTable.on('datatable.search', function(query, matched) {
        setDataTable();
    });
    dataTable.on('datatable.init', function(args) {

        const dom = $(this.dom);
        const tr = dom.find("tbody tr");
        $.each(tr, function(index, item){
            $(item).attr("onclick", "showAnswerModal(this)");
            const contentTd = $(item).find("td").eq(2);
            const dmContent = contentTd.text();
            const divParent = $("<div>");
            const divChild = $("<div>");
            const divLast = $("<div>");
            divParent.addClass("table-overflow");
            divChild.addClass("table-overflow-space");
            divLast.addClass("table-overflow-text");

            divLast.text(dmContent);
            divChild.append(divLast);
            divParent.append(divChild);
            contentTd.text("");
            contentTd.append(divParent);
        })
    });

    function setDataTable() {
        const tr = $(".table-inquiry tbody tr");
        $.each(tr, function(index, item){
            $(item).attr("onclick", "showAnswerModal(this)");
            const contentTd = $(item).find("td").eq(2);
            const dmContent = contentTd.text();
            const divParent = $("<div>");
            const divChild = $("<div>");
            const divLast = $("<div>");
            divParent.addClass("table-overflow");
            divChild.addClass("table-overflow-space");
            divLast.addClass("table-overflow-text");

            divLast.text(dmContent);
            divChild.append(divLast);
            divParent.append(divChild);
            contentTd.text("");
            contentTd.append(divParent);
        })
    }

});


