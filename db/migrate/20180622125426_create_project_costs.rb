class CreateProjectCosts < ActiveRecord::Migration[5.1]
  def change
    create_table :project_costs do |t|
        # 归属项目
        t.integer :project_id, default: 0
        # 工模费
        t.integer :mould_fee, default: 0
        # 劳务费
        t.integer :labor_fee, default: 0
        # 人工费
        t.integer :manual_fee, default: 0
        # 托管费
        t.integer :custodian_fee, default: 0
        # 本期工程费合计
        t.integer :sum_engineer_fee, default: 0
        # 本期费用合计
        t.integer :sum_fee, default: 0
        # 提交时间
        t.datetime :commit_time
        t.timestamps
    end
  end
end
