class Room < ApplicationRecord
    validates :name, presence: true
    validates :name, length: {maximum: 30}

    validates :place, presence: true 
 #   validates :place, inclusion: {in: ['東京', '大阪', '福岡', '札幌', '仙台', '名古屋', '金沢']}

    validates :number, presence: true
 #   validates :number, numericality: {greater_than: 4, less_than: 31}
    
    validate :name_check
    validate :number_check


    has_many :entries, dependent: :destroy

    private
    def name_check
        name_pattern = /\A.+#\d{2}\z/
        unless name_pattern.match(self.name)
            errors.add(:name, "会議室名が正しくありません")
        end
    end

    private
    def number_check
        if (self.number.to_i % 5) != 0 
            errors.add(:number, "収容人数は５の倍数で指定してください")
        end
    end

end
