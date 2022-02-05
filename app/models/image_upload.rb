class ImageUpload < ApplicationRecord
    has_one_attached :upload_excel
    require 'roo-xls'

    def self.import(file)
        spreadsheet = open_spreadsheet(file)
        # header = spreadsheet.row(1)
        # data=[]
        # (2..spreadsheet.last_row).each do |i|
        #   row = Hash[[header, spreadsheet.row(i)].transpose]
        #   data << row.to_hash
        # #   product = find_by_id(row["id"]) || new
        # #   product.attributes = row.to_hash.slice(*accessible_attributes)
        # #   product.save!
        # end
      end
      
      def self.open_spreadsheet(file)
        case File.extname(file.original_filename)
        when ".csv" then Csv.new(file.path, nil, :ignore)
        when ".xls" then Excel.new(file.path, nil, :ignore)
        when ".xlsx" then Roo::Excelx.new(file.path)
        else raise "Unknown file type: #{file.original_filename}"
        end
      end
end
