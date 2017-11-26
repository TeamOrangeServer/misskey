import StreamManager from './stream-manager';
import Connection from './requests-stream';

export default class RequestsStreamManager extends StreamManager<Connection> {
	public getConnection() {
		if (this.connection == null) {
			this.connection = new Connection();
		}

		return this.connection;
	}
}
