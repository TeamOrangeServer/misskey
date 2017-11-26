<mk-tips-home-widget>
	<p ref="tip"><i class="fa fa-lightbulb-o"></i><span ref="text"></span></p>
	<style>
		:scope
			display block
			overflow visible !important

			> p
				display block
				margin 0
				padding 0 12px
				text-align center
				font-size 0.7em
				color #999

				> i
					margin-right 4px

				kbd
					display inline
					padding 0 6px
					margin 0 2px
					font-size 1em
					font-family inherit
					border solid 1px #999
					border-radius 2px

	</style>
	<script>
		import anime from 'animejs';

		this.mixin('widget');

		this.tips = [
			'<kbd>t</kbd>でタイムラインにフォーカスできます',
			'<kbd>p</kbd>または<kbd>n</kbd>で投稿フォームを開きます',
			'投稿フォームにはファイルをドラッグ&ドロップできます',
			'投稿フォームにクリップボードにある画像データをペーストできます',
			'ドライブにファイルをドラッグ&ドロップしてアップロードできます',
			'ドライブでファイルをドラッグしてフォルダ移動できます',
			'ドライブでフォルダをドラッグしてフォルダ移動できます',
			'ホームは設定からカスタマイズできます',
			'MisskeyはMIT Licenseです',
			'タイムマシンウィジェットを利用すると、簡単に過去のタイムラインに遡れます',
			'投稿の ... をクリックして、投稿をユーザーページにピン留めできます',
			'ドライブの容量は(デフォルトで)1GBです',
			'投稿に添付したファイルは全てドライブに保存されます',
			'ホームのカスタマイズ中、ウィジェットを右クリックしてデザインを変更できます',
			'タイムライン上部にもウィジェットを設置できます',
			'投稿をダブルクリックすると詳細が見れます',
			'「**」でテキストを囲むと**強調表示**されます',
			'チャンネルウィジェットを利用すると、よく利用するチャンネルを素早く確認できます',
			'いくつかのウィンドウはブラウザの外に切り離すことができます',
			'カレンダーウィジェットのパーセンテージは、経過の割合を示しています',
			'APIを利用してbotの開発なども行えます',
			'MisskeyはLINEを通じてでも利用できます',
			'まゆかわいいよまゆ',
			'Misskeyは2014年にサービスを開始しました',
			'対応ブラウザではMisskeyを開いていなくても通知を受け取れます'
		]

		this.on('mount', () => {
			this.set();
			this.clock = setInterval(this.change, 20000);
		});

		this.on('unmount', () => {
			clearInterval(this.clock);
		});

		this.set = () => {
			this.refs.text.innerHTML = this.tips[Math.floor(Math.random() * this.tips.length)];
		};

		this.change = () => {
			anime({
				targets: this.refs.tip,
				opacity: 0,
				duration: 500,
				easing: 'linear',
				complete: this.set
			});

			setTimeout(() => {
				anime({
					targets: this.refs.tip,
					opacity: 1,
					duration: 500,
					easing: 'linear'
				});
			}, 500);
		};
	</script>
</mk-tips-home-widget>
