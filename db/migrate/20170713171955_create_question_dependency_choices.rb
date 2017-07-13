class CreateQuestionDependencyChoices < ActiveRecord::Migration[5.1]
  def change
    create_table :question_dependency_choices, id: :uuid do |t|
      t.uuid :question_dependency_id
      t.uuid :choice_id

      t.timestamps
    end

    add_index(:question_dependency_choices, :question_dependency_id)
    add_index(:question_dependency_choices, :choice_id)
  end
end
