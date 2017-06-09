class AddCompositeFieldToQuestionSubmissions < ActiveRecord::Migration[5.1]
  def change
    add_column :question_submissions, :composite, :json
  end
end
