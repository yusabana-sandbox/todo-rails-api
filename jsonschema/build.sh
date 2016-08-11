#!/bin/sh -x -e

echo cmbine start
bundle exec prmd combine --meta meta.yml -o dist/schema.json schemata/
# bundle exec prmd combine --meta meta.yml -o dist/schema.json schemata/hoge.yml
echo cmbine end

echo ********************

# シンタックスチェック
bundle exec prmd verify dist/schema.json >/dev/null

echo gen markdown start
bundle exec prmd doc --prepend overview.md dist/schema.json > dist/schema.md
echo gen markdown end

# # jsonでエスケープしている場合、markdown化する時に<pre>(バックスラッシュ3つ)で
# # 囲われているところでエスケープ文字が入るのでそれを削除する
# ###mv build/api_${lang}.md build/api_${lang}.md.bk
# ###sed -e 's/\\\\//g' build/api_${lang}.md.bk > build/api_${lang}.md
# ###rm -f build/api_${lang}.md.bk
#
# echo '***' >> build/api_${lang}.md
# echo '©1PAC. INC.' >> build/api_${lang}.md
#
# echo '########################################'
# echo "Generated >> ${lang}.md
