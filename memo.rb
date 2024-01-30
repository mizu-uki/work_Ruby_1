require "csv" # CSVファイルを扱うためのライブラリを読み込んでいます

loop do
    puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"

    memo_type = gets.to_i # ユーザーの入力値を取得し、数字へ変換しています

    # if文を使用して続きを作成していきましょう。
    # 「memo_type」の値（1 or 2）によって処理を分岐させていきましょう。

    if memo_type == 1
        puts "拡張子を除いたファイルを入力してください"
        memo_file_name = gets.chomp + ".csv"
        puts "メモしたい内容を記入してください"
        puts "完了したらCtrl + Dをおします"
        memo_contents = readlines.map(&:chomp)

        CSV.open(memo_file_name, 'w') do |csv|
            memo_contents.each do |line|
                csv << [line]
            end
        end
        break
    elsif memo_type == 2
        puts "拡張子を除いた既存のファイル名を入力してください。既存ファイルが存在しない場合、新規ファイルが作成されます。"
        memo_file_name = gets.chomp + ".csv"
        puts "追記したい内容を記入してください"
        puts "完了したらCtrl + Dをおします"

        memo_add_contents = readlines.map(&:chomp)

        CSV.open(memo_file_name, 'a') do |csv|
            memo_add_contents.each do |line|
                csv << [line]
            end
        end
        break
    else
        puts "不正な値が入力されました。1または2を入力してください。"
    end 
end