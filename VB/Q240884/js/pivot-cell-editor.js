window.DxSample = window.DxSample || {
    destroyCurrentEditor: function () {
        if (DxSample.currentEditor != undefined) {
            var container = DxSample.currentEditor.parentElement;
            var displayText = container.getElementsByTagName('div')[0].innerHTML;
            container.innerHTML = '';
            container.innerHTML = displayText;
            delete DxSample.currentEditor;
        }
    },
    createEditor: function (e) {
        var editor = document.createElement('input');
        editor.value = Number(e.Value);
        editor.style.width = String(e.HtmlEvent.currentTarget.clientWidth - 14) + 'px';
        editor.onkeydown = function (ea) {
            switch (ea.keyCode) {
                case 13: // ENTER
                    pivot.PerformCallback('D|' + e.ColumnIndex + '|' + e.RowIndex + '|' + editor.value);
                    return false;
                case 27: // ESCAPE
                    DxSample.destroyCurrentEditor();
                    return false;
            }
        };
        editor.onclick = function (ea) {
            if (ea.stopPropagation == undefined)
                ea.cacnelBubble = true;
            else ea.stopPropagation();
        };
        return editor;
    },
    hideDisplayText: function (e) {
        var displayText = e.HtmlEvent.currentTarget.innerHTML;
        var hiddenText = document.createElement('div');
        hiddenText.style.display = 'none';
        hiddenText.innerHTML = displayText;
        return hiddenText;
    },
    onPivotCellClick: function (s, e) {
        DxSample.destroyCurrentEditor();
        var editor = DxSample.createEditor(e);
        var hiddenText = DxSample.hideDisplayText(e);
        e.HtmlEvent.currentTarget.innerHTML = '';
        e.HtmlEvent.currentTarget.appendChild(editor);
        e.HtmlEvent.currentTarget.appendChild(hiddenText);
        editor.focus();
        DxSample.currentEditor = editor;
    }
};