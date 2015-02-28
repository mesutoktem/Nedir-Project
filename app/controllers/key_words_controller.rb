#encoding: utf-8
class KeyWordsController < ApplicationController
  before_action :set_key_word, only: [:show, :edit, :update, :destroy]


  # GET /key_words
  # GET /key_words.json
  def index
    @key_words = KeyWord.all

    @keyword_name=params[:keyword_name]



    if @keyword_name.present?

      render :search

    end

    #####################################################################
    # Bu kısım ilgili kelime sorgusuna ait dosya var ise onu açacak

    #unless @keyword_name.nil?
    #  if FileTest.exists?(file_path(@keyword_name))
    #    render "key_words/with_patterns/#{@keyword_name}"
    #  else
    #    render :index
    #  end

    #end

    #####################################################################

  end

  # GET /key_words/1
  # GET /key_words/1.json
  def show
  end


  def search



    result=false

    search_for=params["keyword_name"]

    #pattern'ı arıyor.Pattern ve KeyWord şeklinde dönüyor.
    if search_for.present?
     key_word_and_pattern=search_pattern(search_for)
    end

    #dönen veritabanı arama sonucunda her ikiside dolu ise ve KeyWord nil değilse sonuç bulunmuştur diyoruz.
    if key_word_and_pattern.present?&&key_word_and_pattern["pattern"].present? && key_word_and_pattern["key_word"]!=""
      result=search_key_word(key_word_and_pattern["key_word"])
    end

    if result

    @result="bulundu"

    crude_title= "#{key_word_and_pattern["key_word"]} #{key_word_and_pattern["pattern"].split('_').join(' ')}"
    @title="#{crude_title}?".capitalize

    crude_text=get_pattern_type_text(key_word_and_pattern["pattern"])
    @text=prepare_pattern_text(crude_title,crude_text)

    set_meta_tags :title => @title
    set_meta_tags :description => "#{key_word_and_pattern["key_word"]}, #{@title}, #{key_word_and_pattern["key_word"]} nedir, #{key_word_and_pattern["key_word"]} ne anlama gelir, #{key_word_and_pattern["key_word"]} nerede kullanılır, #{key_word_and_pattern["key_word"]} nasıl yapılır",
                  :keywords => "#{key_word_and_pattern["key_word"]}, #{@title},#{key_word_and_pattern["key_word"]} nedir, #{key_word_and_pattern["key_word"]} ne anlama gelir, #{key_word_and_pattern["key_word"]} nerede kullanılır, #{key_word_and_pattern["key_word"]} nasıl yapılır"

    else

      @title= "Üzgünüz. İstediğiniz sayfayı bulamadık!"

    @result="bulunamadı"

    end

  end

  def search_key_word(search_for)

    KeyWord.where(:name=>search_for.to_s).first.present?

  end


  def search_pattern(search_for)
    #aranan linki alttire (_) yerlerinden kelimelerine ayırıyoruz.
    sf_array=search_for.split('_')

    #tüm array kelimeleri için sondan başlayarak pattern'da arama yapıyoruz.
    for i in 1..sf_array.length

      #son kelimeden başlayarak başa doğru kelimeleri tek tek alıyor.
      pattern_name=sf_array[sf_array.length-i]

      #döngüye ilk girdiğinde kelimenin arkasında ek olmayacak
      appendix="" if i==1

      #ilk döngü değilse sondan aradığı kalıbın sonuna önceki döngü/döngülerden gelen kelimeyi ekliyor.
      pattern_name="#{pattern_name}_#{appendix}" if i>1

      #hangi pattern'da kalıbı arıyor her seferinde gösteriyoruz.
      puts "searched for #{pattern_name}"

      #eğer pattern'ı bulursa saklıyor ve döngü bitmediyse daha büyük bir kalıp bulma ihtimaline karşı döngüye devam ediyor.
      #örneğin kapı menteşesi nereden alınır aratılmış olsun.
      #veritabanında iki kalıp olsun:
      #alınır ve nereden alınır.
      #pattern ararken alınır için kalıp bulunacak
      #ama burada asıl bulunmak istenen nereden alınır o yüzden döngü sonuna kadar dönmelidir.
      temp=Pattern.where(:name=>pattern_name.to_s).first
      pattern=temp.name if temp.present?

      #aranacak pattern'ın eki her döngüde güncelleniyor.(büyüyor ..._..._... gibi)
      appendix=pattern_name

    end


    if pattern.present?
      #örneğin bulunan kalıp nereden_alınır.
      #ancak bu veritabanında nereden alınır şeklinde kayıtlı
      #bu yüzden alttireleri kaldırıp arama yapıyoruz.
      key_word=search_for.gsub!"_#{pattern}",""
    end

    return {"pattern"=>pattern,"key_word"=>key_word}
  end


  def get_pattern_type_text(pattern_name)

  return nil unless Pattern.find_by_name(pattern_name).present?

  return nil unless Pattern.find_by_name(pattern_name).pattern_type.present?

  Pattern.find_by_name(pattern_name).pattern_type.pattern_text

  end

  # GET /key_words/new
  def new
    @key_word = KeyWord.new
  end

  # GET /key_words/1/edit
  def edit
  end

  # POST /key_words
  # POST /key_words.json
  def create
    @key_word = KeyWord.new(key_word_params)

    respond_to do |format|
      if @key_word.save

        #create_html_files @key_word.name

        format.html { redirect_to @key_word, notice: 'Key word was successfully created.' }
        format.json { render :show, status: :created, location: @key_word }
      else
        format.html { render :new }
        format.json { render json: @key_word.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /key_words/1
  # PATCH/PUT /key_words/1.json
  def update
    respond_to do |format|
      if @key_word.update(key_word_params)
        format.html { redirect_to @key_word, notice: 'Key word was successfully updated.' }
        format.json { render :show, status: :ok, location: @key_word }
      else
        format.html { render :edit }
        format.json { render json: @key_word.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /key_words/1
  # DELETE /key_words/1.json
  def destroy
    @key_word.destroy
    respond_to do |format|
      format.html { redirect_to key_words_url, notice: 'Key word was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def prepare_pattern_text(keyword,pattern_text)

    pattern_text.gsub!PatternType.keyword_symbol,keyword

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_key_word
      @key_word = KeyWord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def key_word_params
      params.require(:key_word).permit(:name, :pattern_type_id)
    end

    def file_path(file_name)
      "#{Rails.root}/app/views/key_words/with_patterns/#{file_name}.html.erb"
    end

    def create_html_files(file_name)
      #########
      # her kelime verildiğinde kelime ile tüm kalıpların kombinasyonu için fiziksel html dosyaları oluşturulacak.,

      array=Pattern.pluck(:name)
      array.each do |a|
        %x(./script/add_view.sh "#{file_name}_#{a}")
      end
      ##############
    end
end
