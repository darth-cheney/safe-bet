baselines
baseline: spec
	<baseline>
	spec 
		for: #common
		do: [ 
			"Packages"
			spec
				package: 'RISCV-Instructions-Core';
				package: 'RISCV-Instructions-Tests' with: [ spec requires: #('RISCV-Instructions-Core') ];
				package: 'RISCV-Examples' with: [ spec requires: #('RISCV-Instructions-Core') ].
				
				
			"Groups"
			spec
				group: #default with: #('RISCV-Instructions-Core' 'RISCV-Instructions-Tests' 'RISCV-Examples').
			
			"Pharo specific packages that are dependencies"	
			spec
				for: #pharo
				do: [ 
					spec
						package: 'RISCV-Instructions-Core' with: [ spec includes: #('RISCV-Extensions-Pharo') ];
						package: 'RISCV-Extensions-Pharo' with: [ spec requires: #('RISCV-Instructions-Core') ] ].
			
			"Squeak specific packages that are dependencies"
			spec
				for: #squeakCommon
				do: [ 
					spec
						package: 'RISCV-Instructions-Core' with: [ spec includes: #('RISCV-Morphic') ];
						package: 'RISCV-Morphic' with: [ spec requires: #('RISCV-Instructions-Core') ] ].
				
			"GToolkit Specific packages"	
			spec
				for: #gtoolkit
				do: [ 
					spec
						package: 'RISCV-Instructions-Core' with: [ spec includes: #('RISCV-GToolkit') ];
						package: 'RISCV-GToolkit' with: [ spec requires: #('RISCV-Instructions-Core') ] ].
					
			
		]