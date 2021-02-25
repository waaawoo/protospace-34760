class CreatePrototypes < ActiveRecord::Migration[6.0]
  def change
    create_table :prototypes do |t|
      t.string :title,      null:false
      t.text :catch_copy,   null:false
      t.text :concept,      null:false
      # イメージは別のツールで導入する
      # t.activestorage :image
      # 外部キー制約（foreign_key:true)を指定するとこれが無いとDB登録不可
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
