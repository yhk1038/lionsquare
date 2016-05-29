# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

School.create!([
    { name: '연세대학교(서울)' },
    { name: '연세대학교(원주)' },
    { name: '서강대학교' },
    { name: '이화여자대학교' },
    { name: '홍익대학교' },
    { name: '동국대학교' },
    { name: '상명대학교' },
    { name: '해외대학교' },
    { name: '중앙대학교' },
    { name: '숭실대학교' },
    { name: '가천대학교' },
    { name: '한동대학교' },
    { name: '단국대학교' },
    { name: '한국외국어대학교' }
])
Category.create!([
    {name: "개발자 모여라"},
    {name: "기획자 모여라"},
    {name: "디자이너 모여라"},
    {name: "각 학교운영진"},
    {name: "멋사 있는 학교"},
    {name: "각종 해커톤 정보"},
    {name: "덕밍아웃"},
    {name: "기수별 멋사모임"}
])

(1..8).to_a.each do |i|
    Board.create(category_id: i, name: "1번째 게시판")
    Board.create(category_id: i, name: "2번째 게시판")
    Board.create(category_id: i, name: "3번째 게시판")
    Board.create(category_id: i, name: "4번째 게시판")
    Board.create(category_id: i, name: "5번째 게시판")
    Board.create(category_id: i, name: "6번째 게시판")
    Board.create(category_id: i, name: "7번째 게시판")
    Board.create(category_id: i, name: "8번째 게시판")
    Board.create(category_id: i, name: "9번째 게시판")
    Board.create(category_id: i, name: "10번째 게시판")
    Board.create(category_id: i, name: "11번째 게시판")
    Board.create(category_id: i, name: "12번째 게시판")
    Board.create(category_id: i, name: "13번째 게시판")
end
    Board.create(category_id: 8, name: "14번째 게시판")

(1..105).to_a.each do |po|
    Posting.create(board_id: po, title: 'First', content: '첫 글 입니다.')
    Posting.create(board_id: po, title: 'Second', content: '두 글 입니다.')
    Posting.create(board_id: po, title: 'Third', content: '세 글 입니다.')
end

(1..315).to_a.each do |r|
    Reply.create(content: "#{r}번째글 댓글1", posting_id: r )
    Reply.create(content: "#{r}번째글 댓글2", posting_id: r )
    Reply.create(content: "#{r}번째글 댓글3", posting_id: r )
    Reply.create(content: "#{r}번째글 댓글4", posting_id: r )
    Reply.create(content: "#{r}번째글 댓글5", posting_id: r )
    Reply.create(content: "#{r}번째글 댓글6", posting_id: r )
end