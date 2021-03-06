package org.apache.lucene.index

class RefreshableIndexHolder(ir: IndexReader) extends FilterIndexReader(ir) {
  def setInternal(i: IndexReader) = this.in = i
  override def getSequentialSubReaders() = null
  override def getIndexCommit() = IndexReader.open(this.in.directory, true).getIndexCommit()
}