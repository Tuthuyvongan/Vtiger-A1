{strip}
    <div style="font-weight: bold;font-size: 15px;margin-bottom: 10px;">Candidate's History</div>
    <div>
        <table style="border: solid 1px #d0c7c7;width: 100%;">
            <tr>
                <th style="border-right: solid 1px #d0c7c7;width: 20%">Performed Date</th>
                <th style="border-right: solid 1px #d0c7c7;width: 60%;">Description</th>
                <th style="border-right: solid 1px #d0c7c7;width: 20%">Action</th>
            </tr>
            {foreach from=$HISTORYS item=HISTORY}
                <tr data-note="{$HISTORY.note}" data-id="{$HISTORY.id}" data-candidate="{$HISTORY.employ_id}">
                    <td style="border: solid 1px #d0c7c7;width: 20%;line-height: 30px;padding-left: 4px;">{$HISTORY.date}</td>
                    <td style="border: solid 1px #d0c7c7;width: 60%;line-height: 30px;padding-left: 4px;" class="note">
                        <div class="noteContent">
                        {$HISTORY.note}
                        </div>
                        <div class="edit" style="display: none;">
                            <textarea style="width: 100%;"></textarea>
                            <button class="saveNote" onclick="saveNote(this)">Save</button>
                        </div>
                        <span class="action pull-right"><a href="#" onclick="updateNote(this);" class="editNote fa fa-pencil"></a></span>
                    </td>
                    <td style="border: solid 1px #d0c7c7;width: 20%;line-height: 30px;padding-left: 4px;">{$HISTORY.action}</td>
                </tr>
            {/foreach}
        </table>
    </div>
{/strip}
{literal}
    <script type="text/javascript">

        function updateNote(elem) {
            var element = jQuery(elem);
            var tr = element.closest('tr');
            var td = element.closest('td');
            var noteValue = tr.data('note');
            td.find('textarea').html(noteValue);
            td.find(".noteContent").hide();
            td.find(".edit").show();
            td.find(".action").hide();
        }

        function saveNote(elem) {
            var element = jQuery(elem);
            var tr = element.closest('tr');
            var td = element.closest('td');
            var note_id = tr.data('id');
            var candidate_id = tr.data('candidate');
            var note_content = td.find('textarea').val();
            app.helper.showProgress();
            var params = {
                'module': 'Candidates',
                'record': candidate_id,
                'note_id': note_id,
                'note_content':note_content,
                'action': 'Commons',
                'mode': 'updateNote'
            }
            app.request.post({data: params}).then(
                function (err, data) {
                    app.helper.hideProgress();
                    var tr = element.closest('tr');
                    var td = element.closest('td');
                    td.find(".noteContent").html(data).show();
                    td.find(".edit").hide();
                    td.find(".action").show();
                }
            );
        }

    </script>
{/literal}