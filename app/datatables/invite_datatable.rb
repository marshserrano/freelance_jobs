class InviteDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      created_at:   { source: "Invite.created_at" },
      post_id:      { source: "Invite.post_id" },
      recipient_id: { source: "Invite.recipient_id" },
      content:      { source: "Invite.content" },
      status:       { source: "Invite.status" }
    }
  end

  def data
    records.map do |record|
      {
        created_at:   record.created_at,
        post_id:      record.post_id,
        recipient_id: record.recipient_id,
        content:      record.content,
        status:       record.status,
        DT_RowId:     record.id
      }
    end
  end

  def get_raw_records
    # insert query here
    # User.all
    options[:user].invites
  end

end
