import DriveFile from '../../../models/drive-file';
import getDriveCapacity from '../../../misc/get-drive-capacity';
import define from '../define';

export const meta = {
	desc: {
		'ja-JP': 'ドライブの情報を取得します。',
		'en-US': 'Get drive information.'
	},

	tags: ['drive', 'account'],

	requireCredential: true,

	kind: 'drive-read',

	res: {
		type: 'object',
		properties: {
			capacity: {
				type: 'number'
			},
			usage: {
				type: 'number'
			}
		}
	}
};

export default define(meta, async (ps, user) => {
	// Calculate drive usage
	const usage = await DriveFile.aggregate([{
		$match: {
			'metadata.userId': user._id,
			'metadata.deletedAt': { $exists: false }
		}
	}, {
		$project: {
			length: true
		}
	}, {
		$group: {
			_id: null,
			usage: { $sum: '$length' }
		}
	}])
	.then((aggregates: any[]) => {
		if (aggregates.length > 0) {
			return aggregates[0].usage;
		}
		return 0;
	});

	return {
		capacity: await getDriveCapacity(user),
		usage: usage
	};
});
