class ChangeColumnDefault < ActiveRecord::Migration[5.2]
  def change
    change_column_default :job_posts, :status, 'open'
  end
end
