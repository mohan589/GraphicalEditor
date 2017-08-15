require_relative 'draw_image'

class EditImage
    DATA_RANGE_1_250 = '[1-9][0-9]?|1[0-9]{2}|2[0-4][0-9]|250'

  def run(params)
    case params
      when /^I (#{DATA_RANGE_1_250}) (#{DATA_RANGE_1_250})$/
        @draw_image = DrawImage.new($1.to_i, $2.to_i)
      when /^C$/
        @draw_image.clear
      when /^L (#{DATA_RANGE_1_250}) (#{DATA_RANGE_1_250}) ([A-Z])$/
        @draw_image.fill_colour($1.to_i, $2.to_i, $3)
      when /^F (#{DATA_RANGE_1_250}) (#{DATA_RANGE_1_250}) ([A-Z])$/
          @draw_image.region($1.to_i, $2.to_i, $3)
      when /^H (#{DATA_RANGE_1_250}) (#{DATA_RANGE_1_250}) (#{DATA_RANGE_1_250}) ([A-Z])$/
        @draw_image.horizontal($1.to_i, $2.to_i, $3.to_i, $4)
      when /^V (#{DATA_RANGE_1_250}) (#{DATA_RANGE_1_250}) (#{DATA_RANGE_1_250}) ([A-Z])$/
        @draw_image.vertical($1.to_i, $2.to_i, $3.to_i, $4)      
      when /^S$/
        puts @draw_image
      when /^X$/
        exit
      else
        puts 'Command not found'
    end
  end
end
