require 'rails_helper'

RSpec.describe Owner, type: :model do
  let(:owner) { FactoryBot.create(:owner) }

  describe 'validations' do
    # 名前、メールアドレス、パスワード、郵便番号、都道府県、市町村、建物名があれば有効な状態であること
    it "is valid with a name, email, and password" do
      expect(owner).to be_valid
    end

    # 名前がなければ無効な状態であること
    it "is invalid without a name" do
      owner.name = ''
      owner.valid?
      expect(owner.errors[:name]).to include("を入力してください")
    end

    # メールアドレスがなければ無効な状態であること
    it "is invalid without a email" do
      owner.email = ''
      owner.valid?
      expect(owner.errors[:email]).to include("を入力してください")
    end

    # パスワードがなければ無効な状態であること
    it "is invalid without a password" do
      owner.password = nil
      owner.valid?
      expect(owner.errors[:password]).to include("を入力してください")
    end

    it 'emailが空では登録できないこと' do
      owner.email = ''
      owner.valid?
      expect(owner.errors[:email]).to include('を入力してください')
    end

    # 郵便番号がなければ無効な状態であること
    it "is invalid without a post_code" do
      owner.post_code = ''
      owner.valid?
      expect(owner.errors[:post_code]).to include("を入力してください")
    end

    # 都道府県がなければ無効な状態であること
    it "is invalid without a address_prefecture" do
      owner.address_prefecture = ''
      owner.valid?
      expect(owner.errors[:address_prefecture]).to include("を入力してください")
    end

    # 住所がなければ無効な状態であること
    it "is invalid without a address_city" do
      owner.address_city = ''
      owner.valid?
      expect(owner.errors[:address_city]).to include("を入力してください")
    end

    # 名前が51文字以上であれば登録できないこと
    it "is invalid if the name is longer than 50 characters" do
      owner.name = "あ" * 51
      owner.valid?
      expect(owner.errors[:name]).to include("は50文字以内で入力してください")
    end

    # メールアドレスが101文字以上であれば登録できないこと
    it "is invalid if the email is longer than 101 characters" do
      owner.email = "a" * 89 + "@example.com"
      owner.valid?
      expect(owner.errors[:email]).to include("は100文字以内で入力してください")
    end

    # メールアドレスは規定の正規表現に従うこと
    # ドメインのないメールアドレスは無効なこと
    it "is invalid with no domain" do
      owner.email = "test"
      owner.valid?
      expect(owner.errors[:email]).to include("は不正な値です")
    end

    # ドメインのあるメールアドレスは有効なこと
    it "is valid with a domain" do
      owner.email = "test@example.com"
      expect(owner).to be_valid
    end

    # 重複したメールアドレスなら無効な状態であること
    it "is invalid if email is duplicated" do
      Owner.create(
        name:               "Sumner",
        email:              "tester@example.com",
        phone_number:       "08012345678",
        password:           "dottle-nouveau-pavilion-tights-furze",
        post_code:          "1234567",
        address_prefecture: "Tokyo",
        address_city:       "tyuuou",
        address_branch:     "nihonbashi"
      )
      other_owner = Owner.new(
        name:               "Sumner2",
        email:              "tester@example.com",
        phone_number:       "08012345678",
        password:           "dottle-nouveau-pavilion-tights-furze",
        post_code:          "1234567",
        address_prefecture: "Tokyo",
        address_city:       "tyuuou",
        address_branch:     "nihonbashi"
      )
      other_owner.valid?
      expect(other_owner.errors[:email]).to include("はすでに存在します")
    end

  describe "length of phone_number" do
    # 9桁の電話番号は無効であること
    it "is invalid with a phone_number which has less 9 characters" do
      owner.phone_number = "123456789"
      owner.valid?
      expect(owner.errors[:phone_number]).to include("は10文字以上で入力してください")
    end

    # 12桁の電話番号は無効であること
    it "is invalid with a phone_number which has over 12 characters" do
      owner.phone_number = "080123456789"
      owner.valid?
      expect(owner.errors[:phone_number]).to include("は11文字以内で入力してください")
    end

    # 10桁の電話番号は有効であること
    it "is valid with a phone_number which has 10 characters" do
      owner.name = "0123456789"
      expect(owner).to be_valid
    end

    # 11桁の電話番号は有効であること
    it "is valid with a phone_number which has 11 characters" do
      owner.name = "08012345678"
      expect(owner).to be_valid
    end
  end

    # 整数でない電話番号は無効であること
    it "is valid with a phone_number which does not integer" do
      owner.phone_number = "０８０１２３４５６７８"
      owner.valid?
      expect(owner.errors[:phone_number]).to include("は数値で入力してください")
    end

    # パスワードが5文字以下である場合は登録できないこと
    it "is invalid if the password is shorter than 5 characters" do
      owner.password = "dottl"
      owner.valid?
      expect(owner.errors[:password]).to include("は6文字以上で入力してください")
    end

    # パスワードが6文字以上であれば登録できること
    it "is valid if the password is longer than 6 characters" do
      owner.password = "dottle"
      expect(owner).to be_valid
    end

    # 郵便番号が7文字以外であれば登録できないこと
    it "is invalid if post_code is other than 7 characters" do
      owner.post_code = "123456"
      owner.valid?
      expect(owner.errors[:post_code]).to include("は7文字で入力してください")
    end

    # 市町村名が51文字以上であれば登録できないこと
    it "is invalid if the address_city is longer than 51 characters" do
      owner.address_city = "あ" * 51
      owner.valid?
      expect(owner.errors[:address_city]).to include("は50文字以内で入力してください")
    end

    # 建物名が51文字以上であれば登録できないこと
    it "is invalid if the address_branch is longer than 51 characters" do
      owner.address_branch = "あ" * 51
      owner.valid?
      expect(owner.errors[:address_branch]).to include("は50文字以内で入力してください")
    end
  end

  describe "search method" do
    before do
      FactoryBot.create(:owner, name: "rubyonrails")     # OKパターン
      FactoryBot.create(:owner, name: "car_onroad")      # OKパターン
      FactoryBot.create(:owner, name: "train_on_road")   # NGパターン
    end

    # 検索文字列に部分一致するカテゴリを検索できること
    it "can search users if keyword matches partially" do
      owners = Owner.search("onr")
      expect(owners.count).to eq 2
    end

    # 条件に一致するものがない場合、blankとなること
    it "returns blank if keyword matches partially" do
      owners = Owner.search("abc")
      expect(owners.blank?).to be_truthy
    end
  end

  # bcryptによるダイジェスト生成がうまくいくこと
  it "can generate digest successfully by bcrypt" do
    expect(Owner.digest("test")).to include("$2a")
  end

  # base64によるトークン生成がうまくいくこと
  it "can generate a token successfully by base64" do
    expect(Owner.new_token.length).to eq 22
  end

  # remember_digestにトークンが保存されること
  it "saves remember digest successfully" do
    expect(owner.remember_digest).to eq nil
    owner.remember
    expect(owner.remember_digest).to include("$2a")
  end

  # ユーザーのremember digestを破棄できること
  it "can delete remember digest" do
    owner.remember_digest = "test"
    owner.save
    owner.forget
    expect(Owner.find(owner.id).remember_digest).to eq nil
  end
end
