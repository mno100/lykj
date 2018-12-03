package lykj.util;
import java.io.Serializable;

/** 
 *@author 徐景煜
* 类名称：Page    
* 类描述：   分页的工具类
* @version     
* 
 */  
public class Page implements Serializable {
	
	private static final long serialVersionUID = -8652652596351231066L;
    private long pageSize=10;            //页大小
    private long pageIndex=1;          //当前页号
    private long totalPageCount=0;    //总页数
    private long totalCount=0;       //记录总数
    private long nextPage;          //下一页  
    private long prePage;          //上一页
    private long startRow=0;     //开始行
    private long endRow=0;      //结束行
    
	public long getStartRow() {
		return startRow;
	}

	public void setStartRow(long startRow) {
		if(startRow<0){
			this.startRow = 0;
		}else{
			this.startRow = startRow;
		}
	}

	public long getEndRow() {
		return endRow;
	}

	public void setEndRow(long endRow) {
		if(endRow<0){
			this.endRow = 0;
		}else if(endRow<this.startRow){
			this.endRow =this.startRow;
		}else{
			this.endRow = endRow;
		}
	}

	public Page(long pageSize) {
		this.pageIndex = 1L;
		this.pageSize = pageSize;
		this.startRow=0;
		this.endRow=pageSize;
	}

	public Page() {
		this(10);
	}
	/**
	 * 获取任一页第一条数据在数据集的位置.
	 * 
	 * @param pageNo
	 *            从1开始的页号
	 * @param pageSize
	 *            每页记录条数
	 * @return 该页第一条数据
	 */
	public long getStartOfPage() {
		return (this.pageIndex - 1) * pageSize;
	}

	public long getPageSize() {
		return pageSize;
	}

	public void setPageSize(long pageSize) {
		this.pageSize = pageSize;
	}

	public long getPageIndex() {
		this.pageIndex=this.pageIndex<=0?1:this.pageIndex;
		return pageIndex;
	}

	public void setPageIndex(long pageIndex) {
		this.pageIndex = pageIndex;
		this.startRow=(pageIndex-1)*pageSize;
		this.endRow=pageIndex*pageSize;
		//下一页  
        setNextPage();  
        //上一页  
        setPrePage();
	}

	public long getTotalPageCount() {
		return totalPageCount;
	}

	public void setTotalPageCount(long totalPageCount) {
		this.totalPageCount = totalPageCount;
	}

	public long getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(long totalCount) {
		this.totalCount = totalCount;
		this.totalPageCount=totalCount/pageSize+1;
	}

	public long getNextPage() {
		return nextPage;
	}

	public void setNextPage() {
		this.nextPage = this.pageIndex+1;
	}

	public long getPrePage() {
		return prePage;
	}

	public void setPrePage() {
		this.prePage =this.pageIndex-1;  
        if(this.prePage<1){  
            this.prePage=1;
        }
	}
}  
