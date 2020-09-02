*RISCV-GToolkit
asGtView: aView
	<gtView>
	^ aView explicit
		title: 'Bit Layout';
		priority: 1;
		stencil: [
			self asBlElement
		]