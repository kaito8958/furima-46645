class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :delivery_day

  with_options presence: true do
    validates :name
    validates :description
    validates :image
    validates :price
    validates :category_id
    validates :condition_id
    validates :shipping_fee_id
    validates :prefecture_id
    validates :delivery_day_id
  end

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :condition_id
    validates :shipping_fee_id
    validates :prefecture_id
    validates :delivery_day_id
  end

  # 価格の範囲（¥300〜¥9,999,999）
  validates :price, numericality: { only_integer: true,
                                    greater_than_or_equal_to: 300,
                                    less_than_or_equal_to: 9_999_999,
                                    message: 'is out of setting range' }

  # 半角数字のみ許可
  validates :price, format: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters' }
end
